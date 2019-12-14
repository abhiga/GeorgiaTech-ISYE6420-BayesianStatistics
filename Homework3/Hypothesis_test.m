clc;
clear all;
p1 = betacdf(4/5,53.5, 11.5)

fprintf('The postrior p1 is : %.5f .\n', p1);

pi1 = betacdf(4/5,31.5, 3.5)
fprintf('The prior pi1 is : %.5f .\n', pi1);