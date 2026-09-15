function [x,time] = mickeyglass(it,beta, gamma, n, tau_init, dt)
% [beta, gamma, n, tau_init] = param{:};
% dt = 0.1;
step = it/dt;
time = 0:dt:it;
history_length = ceil(tau_init / dt);
x = zeros(1, step + 1);
x_history = 0.5 * ones(1, history_length);
x(1:history_length) = x_history;
for i = history_length : step
    current_time = (i-1) * dt;
    tau_current = tau_init;
    index_delay = i - round(tau_current / dt);

    if index_delay < 1
        x_at_tau = x_history(1);
    else
        x_at_tau = x(index_delay);
    end
    dxdt = (beta * x_at_tau) / (1 + (x_at_tau)^n) - (gamma * x(i));
    x(i+1) = x(i) + dxdt * dt;
end
end