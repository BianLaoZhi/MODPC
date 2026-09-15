iv = [0.4 0.3];
a = 1.4;
b = 0.3;
X = henon(120,iv,a,b);
Xp = henon(60,iv+1e-3,a,b);
X1 = henon(3000,iv,a,b);
X2 = henoncon(3001,iv,a,b,Best_pos);
Xp = [X1;X2(2:end,:)];

clf
reset(gcf);
% plot(X(:,1),'r-','LineWidth',2,DisplayName="H\'enon Map");
hold on
plot(Xp(:,1),'b-','LineWidth',2,DisplayName="H\'enon Map with control");
% plot(Xp(:,1),'b-','LineWidth',2);
% ylim([-1,1])
legend('Interpreter', 'latex');
title("H\'enon Map $(a = 1.4$ and $b = 0.3)$", 'Interpreter', 'latex', 'FontSize', 30);
xlabel('Iteration $(n)$', 'Interpreter', 'latex', 'FontSize', 25);
ylabel('$x_n$', 'Interpreter', 'latex', 'FontSize', 25);
ax = gca;
ax.Box = "off";