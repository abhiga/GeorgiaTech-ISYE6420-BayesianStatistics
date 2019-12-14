 close all
 clear all
  randn("state",1)
  randg("state",1)
  y = [41.00 44.00 43.00 47.00 43.00 46.00 45.00 42.00 45.00 45.00 43.00 45.00 47.00 40.00];
  n = length(y)
%------------------------------------------
NN = 11000;
mus = []; taus = [];
sumdata = sum(y);
%hyperparameters
mu0=45; tau0 = 1/4;
a= 4; b= 2;
% start, initial values
mu = 45;   tau = 1/4; %
for i = 1 : NN
  newmu  = sqrt(1/(tau0+n*tau)) * randn + (tau * sumdata+tau0*mu0)/(tau0+n*tau);
  %par   = b+1/2 * sum ( (y - mu).^2);
  par   = b+1/2 * sum ( (y - newmu).^2);
  newtau = gamrnd(a + n/2, 1/par); %par is rate
  mus = [mus newmu];
  taus = [taus newtau];
  mu=newmu;
  tau=newtau;
end
 
burn =1000;
mus = mus(burn+1:end);
taus=taus(burn+1:end);

mean(mus)
mean(taus)
 prctile(mus,2.5)
 prctile(mus,97.5)
length(mus(mus<45))/length(mus)
 prctile(taus,2.5)
 prctile(taus,97.5)

