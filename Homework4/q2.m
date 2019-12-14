 pkg load statistics
 close all
 clear all
  randn("state",1)
  randg("state",1)
  y1 = [134.00 146.00 104.00 119.00 124.00 161.00 107.00 83.00 113.00 129.00 97.00 123.00];
  n1 = length(y1);
  y2 = [70.00 118.00 101.00 85.00 107.00 132.00 94.00]
  n2 = length(y2); 
%------------------------------------------
NN = 10000;
thetas1 = []; taus1 = [];
thetas2 = []; taus2 = [];
sumdata1 = sum(y1);
sumdata2 = sum(y2);
%hyperparameters
theta10= 110; tau10 = 1/100;
theta20= 110; tau20 = 1/100;
a1= 0.01; b1= 4;
a2= 0.01; b2= 4;
% start, initial values
theta1 = 110;   tau1 = 1/100; %
theta2 = 110;   tau2 = 1/100; %
for i = 1 : NN
  newtheta1  = sqrt(1/(tau10+1*tau1)) * randn + (tau1 * sumdata1+tau10*theta10)/(tau10+n1*tau1);
  %par   = b+1/2 * sum ( (y1 - theta).^2);
  par1   = b1+1/2 * sum ( (y1 - newtheta1).^2);
  newtau1 = gamrnd(a1 + n1/2, 1/par1); %par is rate
  thetas1 = [thetas1 newtheta1];
  taus1 = [taus1 newtau1];
  theta1=newtheta1;
  tau1=newtau1;
  
  newtheta2  = sqrt(1/(tau20+1*tau2)) * randn + (tau2 * sumdata2+tau20*theta20)/(tau20+n2*tau2);
  %par   = b+1/2 * sum ( (y2 - theta).^2);
  par2   = b2+1/2 * sum ( (y2 - newtheta2).^2);
  newtau2 = gamrnd(a2 + n2/2, 1/par2); %par is rate
  thetas2 = [thetas2 newtheta2];
  taus2 = [taus2 newtau2];
  theta2=newtheta2;
  tau2=newtau2;
  
end
 
burn =500;
thetas1 = thetas1(burn+1:end);
taus1=taus1(burn+1:end);

thetas2 = thetas2(burn+1:end);
taus2=taus2(burn+1:end);

thetas1minusthetas2 = thetas1 - thetas2;
mean(thetas1minusthetas2)
length(thetas1minusthetas2(thetas1minusthetas2>0))
 prctile(thetas1minusthetas2,2.5)
 prctile(thetas1minusthetas2,97.5)
mean(thetas1)
mean(taus1)
mean(thetas2)
mean(taus2)

