function syssimulationPartA()
clear
close all

tspan = [0 5];
options = odeset('AbsTol',1e-8,'Refine',5);
%options = odeset('Refine',15);


k = 5;              %spring const
m = 1;              %mass
u_static = 0.75;    %static fricton const
u_kinetic = 0.75;   %kinetic fricton const
g = 9.81;           %acceleration of gravity
w = sqrt(k/m);      %natural frequency


%% Simulation 1 -> Initial Conditions [-5,0] 
xinitial = [-5;0];
[tout, stateout] = ode15s(@(t,state) derivatives(t,state,k,m,u_kinetic,u_static,g,w),tspan,xinitial,options);

figure
plot(tout, stateout(:,1),'DisplayName','Position (m)')
hold on
plot(tout, stateout(:,2),'DisplayName','Velocity (m/s)')
hold off
legend
xlabel('Time t (sec)','Interpreter', 'latex','FontSize',15) 
ylabel('Position (m) and Velocity (m/s)','Interpreter', 'latex','FontSize',15) 
xlim(tspan)
ylim([-7 9])
title('Position and Velocity vs Time Diagram for Simulation 1, Initial Conditions [-5,0]','Interpreter', 'latex','FontSize',15)

xout = stateout(:,1);
xdotout = stateout(:,2)/w;
figure
plot(xout,xdotout)
xlabel('$x_1$ = Position (m)','Interpreter', 'latex','FontSize',15) 
ylabel('$x_2$ = Velocity/$\omega^2$ (m/rad)','Interpreter', 'latex','FontSize',15) 
%xlim([-5.5 3])
%ylim([-1 4])
axis equal
title('Phase Portrait for Simulation 1, Initial Conditions [-5,0]','Interpreter', 'latex','FontSize',15)


%% Simulation 2 -> Initial Conditions [3,0] 
xinitial = [3;0];
[tout, stateout] = ode15s(@(t,state) derivatives(t,state,k,m,u_kinetic,u_static,g,w),tspan,xinitial,options);

figure
plot(tout, stateout(:,1),'DisplayName','Position (m)')
hold on
plot(tout, stateout(:,2),'DisplayName','Velocity (m/s)')
hold off
legend
xlabel('Time t (sec)','Interpreter', 'latex','FontSize',15) 
ylabel('Position (m) and Velocity (m/s)','Interpreter', 'latex','FontSize',15)
xlim(tspan)
ylim([-5 5])
title('Position and Velocity vs Time Diagram for Simulation 2, Initial Conditions [3,0]','Interpreter', 'latex','FontSize',15)

xout = stateout(:,1);
xdotout = stateout(:,2)/w;
figure
plot(xout,xdotout)
xlabel('$x_1$ = Position (m)','Interpreter', 'latex','FontSize',15) 
ylabel('$x_2$ = Velocity/$\omega^2$ (m/rad)','Interpreter', 'latex','FontSize',15) 
%xlim([-0.5 3.5])
%ylim([-1.8 0.5])
axis equal
title('Phase Portrait for Simulation 2, Initial Conditions [3,0]','Interpreter', 'latex','FontSize',15)


%% Simulation 3 -> Initial Conditions [0,-5] 
xinitial = [0;-5];
[tout, stateout] = ode15s(@(t,state) derivatives(t,state,k,m,u_kinetic,u_static,g,w),tspan,xinitial,options);

figure
plot(tout, stateout(:,1),'DisplayName','Position (m)')
hold on
plot(tout, stateout(:,2),'DisplayName','Velocity (m/s)')
hold off
legend
xlabel('Time t (sec)','Interpreter', 'latex','FontSize',15) 
ylabel('Position (m) and Velocity (m/s)','Interpreter', 'latex','FontSize',15)
xlim(tspan)
ylim([-6 2])
title('Position and Velocity vs Time Diagram for Simulation 3, Initial Conditions [0,-5]','Interpreter', 'latex','FontSize',15)

xout = stateout(:,1);
xdotout = stateout(:,2)/w;
figure
plot(xout,xdotout)
xlabel('$x_1$ = Position (m)','Interpreter', 'latex','FontSize',15) 
ylabel('$x_2$ = Velocity/$\omega^2$ (m/rad)','Interpreter', 'latex','FontSize',15) 
%xlim([-1.5 0.5])
%ylim([-3 0.5])
axis equal
title('Phase Portrait for Simulation 3, Initial Conditions [0,-5]','Interpreter', 'latex','FontSize',15)


%% Simulation 4 -> Initial Conditions [-6,6] 
xinitial = [-6;6];
[tout, stateout] = ode15s(@(t,state) derivatives(t,state,k,m,u_kinetic,u_static,g,w),tspan,xinitial,options);

figure
plot(tout, stateout(:,1),'DisplayName','Position (m)')
hold on
plot(tout, stateout(:,2),'DisplayName','Velocity (m/s)')
hold off
legend
xlabel('Time t (sec)','Interpreter', 'latex','FontSize',15) 
ylabel('Position (m) and Velocity (m/s)','Interpreter', 'latex','FontSize',15) 
xlim(tspan)
ylim([-8 13])
title('Position and Velocity vs Time Diagram for Simulation 4, Initial Conditions [-6,6]','Interpreter', 'latex','FontSize',15)

xout = stateout(:,1);
xdotout = stateout(:,2)/w;
figure
plot(xout,xdotout)
xlabel('$x_1$ = Position (m)','Interpreter', 'latex','FontSize',15) 
ylabel('$x_2$ = Velocity/$\omega^2$ (m/rad)','Interpreter', 'latex','FontSize',15) 
%xlim([-7 5])
%ylim([-4 6])
axis equal
title('Phase Portrait for Simulation 4, Initial Conditions [-6,6]','Interpreter', 'latex','FontSize',15)


%% Simulation 5 -> Initial Conditions [4,6] 
xinitial = [4;6];
[tout, stateout] = ode15s(@(t,state) derivatives(t,state,k,m,u_kinetic,u_static,g,w),tspan,xinitial,options);

figure
plot(tout, stateout(:,1),'DisplayName','Position (m)')
hold on
plot(tout, stateout(:,2),'DisplayName','Velocity (m/s)')
hold off
legend
xlabel('Time t (sec)','Interpreter', 'latex','FontSize',15) 
ylabel('Position (m) and Velocity (m/s)','Interpreter', 'latex','FontSize',15) 
xlim(tspan)
ylim([-8 7])
title('Position and Velocity vs Time Diagram for Simulation 5, Initial Conditions [4,6]','Interpreter', 'latex','FontSize',15)

xout = stateout(:,1);
xdotout = stateout(:,2)/w;
figure
plot(xout,xdotout)
xlabel('$x_1$ = Position (m)','Interpreter', 'latex','FontSize',15) 
ylabel('$x_2$ = Velocity/$\omega^2$ (m/rad)','Interpreter', 'latex','FontSize',15) 
%xlim([-2 5])
%ylim([-4 3])
axis equal
title('Phase Portrait for Simulation 5, Initial Conditions [4,6]','Interpreter', 'latex','FontSize',15)
end