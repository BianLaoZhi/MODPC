function x = henon(t,iv,a,b)
x = zeros(t,2);
x(1,:) = iv;
for i = 2:t
    x(i,1) = 1 - a*x(i-1,1)^2 + x(i-1,2);
    x(i,2) = b*x(i-1,1);
end
end