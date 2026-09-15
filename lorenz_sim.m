iv = [0.1 0.3 0.5];
sigma = 10;
rho = 28;
beta = 8/3;
[X,ip1] = lorenz(60,iv,sigma,rho,beta);
[Xp,ip] = lorenz(120,iv+1e-3,sigma,rho,beta);
[X1,ip2] = lorenz(3000,iv,sigma,rho,beta);
[X2,ip2] = lorenzcon(3000,iv,sigma,rho,beta,Best_pos);
Xc = [X1; X2(2:end,:)];
% plot(ip1,X(:,1),'b-','LineWidth',2,DisplayName='Lorenz System')
% plot3(X(:,1),X(:,2),X(:,3),'b-','LineWidth',2)
hold on
% plot3(Xp(:,1),Xp(:,2),Xp(:,3),'r-','LineWidth',2)
% plot(ip,Xp(:,1),'r--','LineWidth',2,DisplayName='Lorenz System with perturbation')
plot(Xc(:,1),'b-','LineWidth',2,DisplayName='Lorenz System with control')
legend('Interpreter', 'latex');
title("Lorenz System $\sigma = 10$, $\rho = 28$, and $\beta = \frac{8}{3}$", 'Interpreter', 'latex', 'FontSize', 30);
xlabel('Iteration $(n)$', 'Interpreter', 'latex', 'FontSize', 25);
ylabel('$x_n$', 'Interpreter', 'latex', 'FontSize', 25);
ax = gca;
ax.Box = "off";