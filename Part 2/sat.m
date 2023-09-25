function sgn = sat(x)

if x > 0.25
    sgn = 1;
elseif x< -0.25
    sgn = -1;
else
    sgn = x/0.5;
end


