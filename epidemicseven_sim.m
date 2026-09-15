iv = [0.7 0.12 0.08 0.05 0.025 0.018 0.007 ];
param = {0.2 0.1 0.15 0.0015 0.0065 0.590071 0.180143 0.05 0.02 0.001 0.05 0.25 0.3 0.2};
lmb = 4.6;
X = epidemicseven(120,iv,lmb,param);
Xp = epidemicseven(120,iv+1e-5,lmb,param);
X1 = epidemicseven(60,iv,lmb,param);
X2 = epidemicsevencon(61,iv,lmb,param,Best_pos);
Xc = [X1; X2(2:end,:)];
% plot(X(:,4),'b-','LineWidth',2,DisplayName='Epidemic Model')
hold on
plot(Xp(:,4),'r--','LineWidth',2,DisplayName='Epidemic Model with perturbation')
plot(Xc(:,4),'b-','LineWidth',2,DisplayName='Epidemic Model with control')
legend('Interpreter', 'latex');
title("Epidemic Model $(\lambda = 4.6)$", 'Interpreter', 'latex', 'FontSize', 30);
xlabel('Times $(t)$', 'Interpreter', 'latex', 'FontSize', 25);
ylabel('Infected $(I_t)$', 'Interpreter', 'latex', 'FontSize', 25);
ax = gca;
ax.Box = "off";