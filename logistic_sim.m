% chaos
r = 3.8;
iv = 0.4;
x = logistic(60,r,iv);
y = logistic(120,r,iv+1e-3);
x1 = logistic(60,r,iv);
x2 = logcon(60,r,iv,Best_pos);
xp = [x1 x2(2:end)];

clf
reset(gcf);
% plot(x,'b-',LineWidth=2,DisplayName='Logistic Map');
hold on
% plot(y,'r--',LineWidth=2,DisplayName='Logistic Map with perturbation');
plot(xp,'b-',LineWidth=2,DisplayName='Logistic Map with control');
ylim([-0.05,1.05])
title('Logistic Map $(r = 3.8)$', 'Interpreter', 'latex', 'FontSize', 30);
xlabel('Time $(t)$', 'Interpreter', 'latex', 'FontSize', 25);
ylabel('$x_n$', 'Interpreter', 'latex', 'FontSize', 25);
ax = gca;
ax.Box = "off";
legend()