close all force
clear all

data = [-2.00 -3.00 4.00 -7.00 0.00 4.00];

theta = 0;

thetas = [theta];

tic
for i = 1:10500
  theta_prop = -2 + (4 * rand)
%--------------------------------------------------------------------------
  prod1 = prod(exp((-1/8)*(theta - theta_prop)*(data.*2 - theta_prop - theta)))
%--------------------------------------------------------------------------
  r = ((cos((pi * theta_prop)/4)/cos((pi * theta)/4))^2)*prod1;
%--------------------------------------------------------------------------
rho = min(r ,1);
   if (rand < rho)
       theta = theta_prop; 
   end
thetas =  [thetas theta];
end
toc
%Burn in 500
 thetas = thetas(500:end);
figure(1)
 hist(thetas, 50)
 mean(thetas)
 prctile(thetas,2.5)
 prctile(thetas,97.5)
