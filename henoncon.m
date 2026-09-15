function x = henoncon(t,iv,a,b,K)
x = zeros(t,2);
x(1,:) = iv;
for i = 2:t
    as = a+K;
    x(i,1) = 1 - as*x(i-1,1)^2+x(i-1,2);
    x(i,2) = b*x(i-1,1);
end
end