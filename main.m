


%% 
% DTBO.
% Driving Training-Based Optimization: A New Human-Based Metaheuristic Algorithm for Solving Optimization Problems
% scientific reports Journal https://www.nature.com/srep/
% " Optimizer"
%%
clc
clear
close all
%%
Fun_name='F8'; 
SearchAgents=30;  
Max_iterations=1000;
%%
tic
[lowerbound,upperbound,dimension,fitness]=fun_info(Fun_name);
[Best_score,Best_pos,DTBO_curve]=DTBO(SearchAgents,Max_iterations,lowerbound,upperbound,dimension,fitness);
toc
%%
display(['The best solution obtained by DTBO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by DTBO is : ', num2str(Best_score)]);

%%
plots=semilogy(DTBO_curve,'Color','g');
set(plots,'linewidth',2)
hold on
title('Objective space',FontSize=25)
xlabel('Iterations',FontSize=20);
ylabel('Best score',FontSize=20);

axis tight
grid on
box on
legend('DTBO')
%%

        