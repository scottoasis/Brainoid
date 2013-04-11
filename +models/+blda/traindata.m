clc
clear

addpathorder;

channel = [1:12];
trinum  = 19;
flanum  = 2;

[accuracy1 br] = crossvalidatep3003( ...
		  {[DATA_HOME_PATH 'AO3' SEP 'sdataoffline' SEP 'AO3-19-S11'],
		   [DATA_HOME_PATH 'AO3' SEP 'sdataoffline' SEP 'AO3-19-S21'],
		   [DATA_HOME_PATH 'AO3' SEP 'sdataoffline' SEP 'AO3-19-S31']}, ...
		  channel, trinum, flanum);

b1 = mean(accuracy1);

x = 1:1:16;
plot(x, accuracy1 .* 100, '-ko');


xlabel('Trials per average');
ylabel('Accuracy (%)');
set(gca,'ylim',[10 100]);
set(gca,'ytick',10:10:100);
set(gca,'xtick',0:1:16);
grid;
