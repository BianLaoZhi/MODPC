function [X,ip] = lorenzcon(n,iv,sigma,rho,beta,K)
X = zeros(n,3);
X(1,:) = iv;
dt = 0.01;
N = n/dt;
ip = linspace(1,n,N);
for i = 2:length(ip)
    rhos = rho* K;
    k = i-1;
    X(i,1) = X(k,1) + dt*(sigma*(X(k,2) - X(k,1)));
    X(i,2) = X(k,2) + dt*(X(k,1)*(rhos - X(k,3)) - X(k,2));
    X(i,3) = X(k,3) + dt*(X(k,1)*X(k,2) - beta*X(k,3));
end
end