function x = logcon(t,r,iv,k)
x = zeros(1,t);
x(1) = iv;
for i = 2:t
    x(i) = x(i-1)*r*(1-x(i-1))*k;
end
end