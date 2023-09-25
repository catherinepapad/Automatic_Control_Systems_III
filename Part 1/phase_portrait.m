function phase_portrait()
clear
close all

k = 1;              %spring const
m = 0.5;            %mass
u_static = 0.1;     %static fricton const
u_kinetic = 0.1;   %kinetic fricton const
g = 9.81;           %acceleration of gravity
w = sqrt(k/m);      %natural frequency

[x1,x2] = meshgrid(-7:.3:7 , -12:.3:12);
x2 = x2./w;
x1dot = w.*x2;
sign = arrayfun(@friction_custom, x1 , x2/w);
x2dot = (-u_kinetic*m*g.*sign-k.*x1)/(m*w);
L = sqrt(x1dot.^2 + x2dot.^2);
figure
%quiver (x1,x2,x1dot./L,x2dot./L,'k','DisplayName','Slope Field');
quiver (x1,x2,x1dot./L,x2dot./L,'DisplayName','Slope Field');
hold on
tspan = [0 40];
x1_in = [-4,0,-5,4];
x2_in = [2,-5,4,6];
options = odeset('AbsTol',1e-8,'Refine',15);
%options = odeset('Refine',15);

% for k=1:1:4
%     %[~, stateout] = ode15s(@derivatives_custom,tspan,[x1_in(k),x2_in(k)],options);
%     x_initial = [x1_in(k);x2_in(k)];
%     [~, stateout] = ode15s(@(t,state) derivatives(t,state,k,m,u_kinetic,u_static,g,w),tspan,x_initial,options);
%     xout = stateout(:,1);
%     xdotout = stateout(:,2)/w;
%     plot(xout,xdotout,'LineWidth',1.5,'DisplayName', sprintf('Initial Conditions: x1 = %d , x2 = %d' , x1_in(k),x2_in(k)))
% end

x_initial = [x1_in(1);x2_in(1)];
[~, stateout] = ode15s(@(t,state) derivatives(t,state,k,m,u_kinetic,u_static,g,w),tspan,x_initial,options);
xout = stateout(:,1);
xdotout = stateout(:,2)/w;
%plot(xout,xdotout,'b','LineWidth',2,'DisplayName', sprintf('Initial Conditions: x1 = %d , x2 = %d' , x1_in(1),x2_in(1)))
plot(xout,xdotout,'LineWidth',2,'DisplayName', sprintf('Initial Conditions: x1 = %d , x2 = %d' , x1_in(1),x2_in(1)))

x_initial = [x1_in(2);x2_in(2)];
[~, stateout] = ode15s(@(t,state) derivatives(t,state,k,m,u_kinetic,u_static,g,w),tspan,x_initial,options);
xout = stateout(:,1);
xdotout = stateout(:,2)/w;
%plot(xout,xdotout,'r','LineWidth',2,'DisplayName', sprintf('Initial Conditions: x1 = %d , x2 = %d' , x1_in(2),x2_in(2)))
plot(xout,xdotout,'LineWidth',2,'DisplayName', sprintf('Initial Conditions: x1 = %d , x2 = %d' , x1_in(2),x2_in(2)))

x_initial = [x1_in(3);x2_in(3)];
[~, stateout] = ode15s(@(t,state) derivatives(t,state,k,m,u_kinetic,u_static,g,w),tspan,x_initial,options);
xout = stateout(:,1);
xdotout = stateout(:,2)/w;
%plot(xout,xdotout,'m','LineWidth',2,'DisplayName', sprintf('Initial Conditions: x1 = %d , x2 = %d' , x1_in(3),x2_in(3)))
plot(xout,xdotout,'LineWidth',2,'DisplayName', sprintf('Initial Conditions: x1 = %d , x2 = %d' , x1_in(3),x2_in(3)))

x_initial = [x1_in(4);x2_in(4)];
[~, stateout] = ode15s(@(t,state) derivatives(t,state,k,m,u_kinetic,u_static,g,w),tspan,x_initial,options);
xout = stateout(:,1);
xdotout = stateout(:,2)/w;
%plot(xout,xdotout,'g','LineWidth',2,'DisplayName', sprintf('Initial Conditions: x1 = %d , x2 = %d' , x1_in(4),x2_in(4)))
plot(xout,xdotout,'LineWidth',2,'DisplayName', sprintf('Initial Conditions: x1 = %d , x2 = %d' , x1_in(4),x2_in(4)))


hold off
axis tight
title('Slope Field and Phase Portraits for Different Initial Conditions','Interpreter', 'latex','FontSize',15)
xlabel('$x_1$ = Position (m)','Interpreter', 'latex','FontSize',15) 
ylabel('$x_2$ = Velocity/$\omega^2$ (m/rad)','Interpreter', 'latex','FontSize',15) 
%xlim([-7 7])
%ylim([-13 13])
axis equal
legend('-DynamicLegend')
legend('show')

end


function frc = friction_custom(x,xdot)
k = 1;              %spring const
m = 0.5;            %mass
u_static = 0.1;     %static fricton const
u_kinetic = 0.1;   %kinetic fricton const
g = 9.81;           %acceleration of gravity
w = sqrt(k/m);      %natural frequency

    
if xdot > 0
    frc = 1;
elseif xdot < 0
    frc = -1;
elseif xdot == 0
    if abs(k*x) < u_static*m*g
        frc = -k*x / (u_kinetic * m * g);
    else
        if x > 0
            frc = - u_static / u_kinetic  ;
        else
            frc = u_static / u_kinetic  ;
        end
    end
end
end





