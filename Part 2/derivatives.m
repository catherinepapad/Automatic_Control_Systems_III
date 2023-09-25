function dstatedt = derivatives(t,state,contr,u_kin,m,g)

%syms t

xd = 2 + sin(2.5*t) + 2*cos(1.25*t);
%xd = double(subs(xd,time));
xddot = 5*(cos(2.5*t)-sin(1.25*t))/2;
%xddot = double(subs(xddot,time));
%xddotdot = double(subs(xddotdot,time));
xddotdot = -25*sin(2.5*t)/4 - 25*cos(1.25*t)/8;

x1 = state(1);
x2 = state(2);


f = (5+0.6*exp(-0.045*t))*x1*(1+0.9*x1^2);


if contr==1
    l = 7;
    c = 80;
    fhat = 7*x1 + 6*x1^3 + 0.625*x1 + 0.5625*x1^3 - 0.625*exp(- 0.0224*t)*x1 - 0.5625*exp(-0.0224*t)*x1^3;
    r = 3*abs(x1) + 4*abs(x1)^3 + 2*0.625*abs(x1) + 2*0.5625*abs(x1)^3 + 9.196875 + 0.75*abs(xddotdot - l*x2 + l*xddot)+c;
    u = fhat + g*1.0625 + 0.75*(xddotdot - l*x2 + l*xddot) -r*sat(x2-xddot+l*x1-l*xd);
elseif contr==2
    l = 7;
    c = 80;
    fmax = 22*abs(x1)^3;
    r = fmax + 0.9375*g + 0.75*abs(xddotdot - l*x2 + l*xddot) + c;
    u = 1.0625*g*sat(x2) + 1.25*(xddotdot - l*x2 + l*xddot) -r*sat(x2-xddot+l*x1-l*xd);
elseif contr==3
    xnew = x1;
    xdotnew = x2;
    x1 = x1 - xd;
    x2 = x2 - xddot;
    fhat = 7*xnew + 6*xnew^3 + 0.625*xnew + 0.5625*xnew^3 - 0.625*exp(- 0.0224*t)*xnew - 0.5625*exp(-0.0224*t)*xnew^3;
    phihat = 1.0625*g*sat(xdotnew) + fhat + xddotdot/1.25;
    Dphi = 3*abs(xnew) + 4*abs(xnew)^3 + 2*0.625*abs(xnew) + 2*0.5625*abs(xnew)^3 + 9.196875 + 1.2* abs(xddotdot);
    btranspose = [0 1];
    Ftranspose = [5 5];
    v = - Ftranspose * [x1;x2];
    P = [11 1;1 6/5];
    dv = -sat(btranspose*P*[x1;x2])*Dphi;
    u = phihat + v + dv;
elseif contr==4
    xnew = x1;
    xdotnew = x2;
    x1 = x1 - xd;
    x2 = x2 - xddot;
    fmax = 22*abs(xnew)^3;
    phihat = 1.0625*g*sat(xdotnew) + xddotdot/1.25;
    Dphi = fmax + 9.196875 + 1.2* abs(xddotdot);
    btranspose = [0 1];
    Ftranspose = [5 5];
    v = - Ftranspose * [x1;x2];
    P = [11 1;1 6/5];
    dv = -sat(btranspose*P*[x1;x2])*Dphi;
    u = phihat + v + dv;
end


xdbldot = (u - f - u_kin*m*g*sat(x2))/(m);  

if abs(state(2))<10^(-8)
    xdot = 0;
else
    xdot = state(2);
end

if abs(xdbldot)<10^(-8)
    xdbldot = 0;
end

dstatedt = [xdot ; xdbldot];

disp(t)

end