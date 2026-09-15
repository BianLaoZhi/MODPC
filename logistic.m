function x=logistic(t,r,iv)
x = zeros(1,t);
x(1) = iv;
for i = 2:t
    x(i) = r*x(i-1)*(1-x(i-1));
end
end