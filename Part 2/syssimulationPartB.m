clear 
close all

tspan = [0 15];
options = odeset('RelTol',1e-4,'AbsTol',1e-6,'Refine',3);

k = 5;              %spring const
m = 1;              %mass
u_static = 0.75;    %static fricton const
u_kin = 0.75;   %kinetic fricton const
g = 9.81;           %acceleration of gravity
w = sqrt(k/m);      %natural frequency

syms t
xd = 2 + sin(2.5*t) + 2*cos(1.25*t);
xddot = diff(xd);
xddotdot = diff(xddot);

%% SLIDING CONTROL , CASE 1 , SIMULATION 1
u = 1;
xinitial = [-5;0];

[tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);

figure
fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
hold on
plot(tout, stateout(:,1),'DisplayName','x(t)')
ylim([-6 5])
xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
title('Sliding Control, Case 1, Initial Conditions [-5,0]','Interpreter', 'latex','FontSize',15)
hl = legend('show');
set(hl, 'Interpreter','latex')

figure
fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
hold on
plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
ylim([-6 20])
xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
title('Sliding Control, Case 1, Initial Conditions [-5,0]','Interpreter', 'latex','FontSize',15)
%legend('-DynamicLegend')
hl = legend('show');
set(hl, 'Interpreter','latex')

%% SLIDING CONTROL , CASE 1 , SIMULATION 2
% u = 1;
% xinitial = [3;0];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-2 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 1, Initial Conditions [3,0]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 10])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 1, Initial Conditions [3,0]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% SLIDING CONTROL , CASE 1 , SIMULATION 3
% u = 1;
% xinitial = [0;-5];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-1 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 1, Initial Conditions [0,-5]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 20])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 1, Initial Conditions [0,-5]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% SLIDING CONTROL , CASE 1 , SIMULATION 4
% u = 1;
% xinitial = [-6;6];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-6 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 1, Initial Conditions [-6,6]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 20])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 1, Initial Conditions [-6,6]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% SLIDING CONTROL , CASE 1 , SIMULATION 5
% u = 1;
% xinitial = [4;6];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-1 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 1, Initial Conditions [4,6]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 8])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 1, Initial Conditions [4,6]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')


%% SLIDING CONTROL , CASE 2 , SIMULATION 1
% u = 2;
% xinitial = [-5;0];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-6 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 2, Initial Conditions [-5,0]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 20])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 2, Initial Conditions [-5,0]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% SLIDING CONTROL , CASE 2 , SIMULATION 2
% u = 2;
% xinitial = [3;0];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-2 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 2, Initial Conditions [3,0]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 10])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 2, Initial Conditions [3,0]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% SLIDING CONTROL , CASE 2 , SIMULATION 3
% u = 2;
% xinitial = [0;-5];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-1 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 2, Initial Conditions [0,-5]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 20])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 2, Initial Conditions [0,-5]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% SLIDING CONTROL , CASE 2 , SIMULATION 4
% u = 2;
% xinitial = [-6;6];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-6 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 2, Initial Conditions [-6,6]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 20])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 2, Initial Conditions [-6,6]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% SLIDING CONTROL , CASE 2 , SIMULATION 5
% u = 2;
% xinitial = [4;6];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-1 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 2, Initial Conditions [4,6]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 8])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Sliding Control, Case 2, Initial Conditions [4,6]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% LYAPUNOV REDESIGN , CASE 1 , SIMULATION 1
% u = 3;
% xinitial = [-5;0];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-6 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 1, Initial Conditions [-5,0]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 20])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 1, Initial Conditions [-5,0]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')


%% LYAPUNOV REDESIGN , CASE 1 , SIMULATION 2
% u = 3;
% xinitial = [3;0];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-2 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 1, Initial Conditions [3,0]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 10])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 1, Initial Conditions [3,0]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% LYAPUNOV REDESIGN , CASE 1 , SIMULATION 3
% u = 3;
% xinitial = [0;-5];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-1 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 1, Initial Conditions [0,-5]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 20])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 1, Initial Conditions [0,-5]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% LYAPUNOV REDESIGN , CASE 1 , SIMULATION 4
% u = 3;
% xinitial = [-6;6];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-6 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 1, Initial Conditions [-6,6]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 20])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 1, Initial Conditions [-6,6]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% LYAPUNOV REDESIGN , CASE 1 , SIMULATION 5
% u = 3;
% xinitial = [4;6];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),tspan,xinitial,options);
% 
% figure
% fplot(xd,[0 15], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-1 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 1, Initial Conditions [4,6]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 15],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 8])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 1, Initial Conditions [4,6]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% LYAPUNOV REDESIGN , CASE 2 , SIMULATION 1
% u = 4;
% xinitial = [-5;0];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),[0 10],xinitial,options);
% 
% figure
% fplot(xd,[0 10], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-6 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 2, Initial Conditions [-5,0]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 10],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 20])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 2, Initial Conditions [-5,0]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')


%% LYAPUNOV REDESIGN , CASE 2 , SIMULATION 2
% u = 4;
% xinitial = [3;0];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),[0 10],xinitial,options);
% 
% figure
% fplot(xd,[0 10], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-2 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 2, Initial Conditions [3,0]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 10],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 10])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 2, Initial Conditions [3,0]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% LYAPUNOV REDESIGN , CASE 2 , SIMULATION 3
% u = 4;
% xinitial = [0;-5];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),[0 10],xinitial,options);
% 
% figure
% fplot(xd,[0 10], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-1 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 2, Initial Conditions [0,-5]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 10],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 20])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 2, Initial Conditions [0,-5]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% LYAPUNOV REDESIGN , CASE 2 , SIMULATION 4
% u = 4;
% xinitial = [-6;6];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),[0 10],xinitial,options);
% 
% figure
% fplot(xd,[0 10], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-6 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 2, Initial Conditions [-6,6]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 10],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 20])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 2, Initial Conditions [-6,6]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

%% LYAPUNOV REDESIGN , CASE 2 , SIMULATION 5
% u = 4;
% xinitial = [4;6];
% 
% [tout, stateout] = ode15s(@(t,state) derivatives(t,state,u,u_kin,m,g),[0 10],xinitial,options);
% 
% figure
% fplot(xd,[0 10], 'DisplayName','$x_d(t)$')
% hold on
% plot(tout, stateout(:,1),'DisplayName','x(t)')
% ylim([-1 5])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Position (m)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 2, Initial Conditions [4,6]','Interpreter', 'latex','FontSize',15)
% hl = legend('show');
% set(hl, 'Interpreter','latex')
% 
% figure
% fplot(xddot,[0 10],'DisplayName','$\dot{x}_d(t)$')
% hold on
% plot(tout, stateout(:,2),'DisplayName','$\dot{x}(t)$')
% ylim([-6 8])
% xlabel('Time (sec)', 'Interpreter', 'latex','FontSize',15)
% ylabel('Velocity (m/s)', 'Interpreter', 'latex','FontSize',15)
% title('Lyapunov Redesign, Case 2, Initial Conditions [4,6]','Interpreter', 'latex','FontSize',15)
% %legend('-DynamicLegend')
% hl = legend('show');
% set(hl, 'Interpreter','latex')

