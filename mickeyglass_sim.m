beta = 2;
gamma = 1;
n = 10;
tau = 2;
[X,time] = mickeyglass(200,beta,gamma,n,tau,0.1);
[X1,time1] = mickeyglass(70,beta,gamma,n,tau,0.1);
[X2,time2] = mickeyglasscon(130,beta,gamma,n,tau,0.1,Best_pos);
Xp = [X1 X2(1:end-1)];
timep = [time1 time2];
plot(time,X,'r--','LineWidth',2)
hold on
plot(time,Xp,'b-','LineWidth',2)
title("Mackey-Glass ($n = 10$)", 'Interpreter', 'latex', 'FontSize', 30);
xlabel('Times $(t)$', 'Interpreter', 'latex', 'FontSize', 25);
ylabel('$x(t)$', 'Interpreter', 'latex', 'FontSize', 25);
ax = gca;
ax.Box = "off";