function X = epidemicsevencon(n,iv,lambdas,param,K)
X = zeros(n,7);
X(1,:) = iv;
[phi1, phi2, tau1, gamman, rho, p, r, q, d, zeta, tau2, gammam, mu, Ib] = param{:};
for i = 2:n
    k = i-1;
    lambda = lambdas * K;
    % lambda = lambdas*K(1) + sin(K(2)*lambdas);
    % lambda = lambdas + K(1)*exp(-K(2)^2)-K(3)*cos(lambdas);
    % lambda = lambdas*(1+K(1)*tanh(K(2))) + K(3)*log(abs(K(4))) - K(5)*lambdas^2;
    % lambda = lambdas + K(1)*sqrt(abs(K(2)))-K(3)^2 *log(K(4)^2 +1);
    Lambda = mu*1;
    Xn = num2cell(X(k,:));
    [S, V1, V2, I, Q, R, D] = Xn{:};
    if I <= Ib
        F = (gamman + gammam)*I;
    else
        F = (gamman + gammam)*Ib + gamman*(I-Ib);
    end
    X(i,1) = S + Lambda - lambda*S*I - lambda*q*S*Q - phi1*S + rho*R - mu*S;
    X(i,2) = V1 + phi1*S - lambda*p*V1*I - lambda*p*q*V1*Q - phi2*V1 - mu*V1;
    X(i,3) = V2 + phi2*V1 - lambda*r*V2*I - lambda*r*q*V2*Q - mu*V2;
    X(i,4) = I + lambda*S*I + lambda*p*V1*I + lambda*r*V2*I + lambda*q*S*Q + lambda*p*q*V1*Q + lambda*r*q*V2*Q - tau1*I + tau2*Q - mu*I - zeta*I - F;
    X(i,5) = Q + tau1*I - tau2*Q - gamman*Q - zeta*d*Q - mu*Q;
    X(i,6) = R + gamman*Q - rho*R - mu*R + F;
    X(i,7) = D + zeta*I + zeta*d*Q;
end
end