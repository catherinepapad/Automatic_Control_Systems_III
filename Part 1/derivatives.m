function dstatedt = derivatives(t,state,k,m,u_kinetic,u_static,g,w)
x1 = state(1);

if abs(state(2))<10^(-8)
    x2 = 0;
else
    x2 = state(2);
end

xdot = x2;

%xdbldot = (-k*x)/(m);              %No friction
xdbldot = (-u_kinetic*m*g*friction(x1,x2,k,m,g,u_static,u_kinetic)-k*x1)/(m);  

dstatedt = [xdot ; xdbldot];
end