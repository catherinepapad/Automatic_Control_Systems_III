function frc = friction(x,xdot,k,m,g,u_static,u_kinetic)

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