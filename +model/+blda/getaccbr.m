clc
clear
trinum=19;
flanum=2;

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%%Eql to line:
% Author:	 Scott Wang
% Composed Date: 2013/03/22
%
% [accuracy1 br1]=classresult1( 
%       { 'F:\dataP300\data\AN7\sdataoffline\AN7-19-S11',  ...
%	  'F:\dataP300\data\AN7\sdataoffline\AN7-19-S12',  ...
% 	  'F:\dataP300\data\AN7\sdataoffline\AN7-19-S13'}, ...
%       trinum,flanum);
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% 
%%the path to data is supposed to 
% /home/scott/Document/BCI/data/AN7/sdataoff/AN7-19-S11
% for example, which can be decomposed like:
% 
% /home/scott/Document/BCI/data/ - <DATA_HOME_PATH>      
% AN7/				 - <subject_name>
% sdataoff/			 - <trial_unique_path>
% AN7-19-S11			 - <tial_ID>
% 
% function concated_path = path_concater(
% DATA_HOME_PATH = "/home/scott/Documents/BCI/data/"
% SEP = "/"
% 
% folder_path = DATA_HOME_PATH + tial_name + SEP + 
% 
% function [accuracy bit_rate] = calc_accu_br( subject_name, ...
%					       tial_name,    ...
%					       n_trials,     ...
%					       n_flashes )
% 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

[accuracy1 br1]=classresult1({'F:\dataP300\data\AN7\sdataoffline\AN7-19-S11'...
,'F:\dataP300\data\AN7\sdataoffline\AN7-19-S12',...
'F:\dataP300\data\AN7\sdataoffline\AN7-19-S13'}, trinum,flanum);
[accuracy2 br2]=classresult1({'F:\dataP300\data\AO3\sdataoffline\AO3-19-S11'...
,'F:\dataP300\data\AO3\sdataoffline\AO3-19-S21',...
'F:\dataP300\data\AO3\sdataoffline\AO3-19-S31'}, trinum,flanum);
[accuracy3 br3]=classresult1({'F:\dataP300\data\BC9\sdataoffline\BC9-19-S11'...
,'F:\dataP300\data\BC9\sdataoffline\BC9-19-S21',...
'F:\dataP300\data\BC9\sdataoffline\BC9-19-S31'}, trinum,flanum);
[accuracy4 br4]=classresult1({'F:\dataP300\data\BD1\sdataoffline\BD1-19-S11'...
,'F:\dataP300\data\BD1\sdataoffline\BD1-19-S21',...
'F:\dataP300\data\BD1\sdataoffline\BD1-19-S31'}, trinum,flanum);
[accuracy5 br5]=classresult1({'F:\dataP300\data\BD2\sdataoffline\BD2-19-S11'...
,'F:\dataP300\data\BD2\sdataoffline\BD2-19-S21',...
'F:\dataP300\data\BD2\sdataoffline\BD2-19-S31'}, trinum,flanum);
[accuracy6 br6]=classresult1({'F:\dataP300\data\BD3\sdataoffline\BD3-19-S11'...
,'F:\dataP300\data\BD3\sdataoffline\BD3-19-S21',...
'F:\dataP300\data\BD3\sdataoffline\BD3-19-S31'}, trinum,flanum);
[accuracy7 br7]=classresult1({'F:\dataP300\data\BD6\sdataoffline\BD6-19-S11'...
,'F:\dataP300\data\BD6\sdataoffline\BD6-19-S21',...
'F:\dataP300\data\BD6\sdataoffline\BD6-19-S31'}, trinum,flanum);
[accuracy8 br8]=classresult1({'F:\dataP300\data\BD7\sdataoffline\BD7-19-S11'...
,'F:\dataP300\data\BD7\sdataoffline\BD7-19-S21',...
'F:\dataP300\data\BD7\sdataoffline\BD7-19-S31'}, trinum,flanum);
[accuracy9 br9]=classresult1({'F:\dataP300\data\BD8\sdataoffline\BD8-19-S11'...
,'F:\dataP300\data\BD8\sdataoffline\BD8-19-S21',...
'F:\dataP300\data\BD8\sdataoffline\BD8-19-S31'}, trinum,flanum);
[accuracy10 br10]=classresult1({'F:\dataP300\data\BD9\sdataoffline\BD9-19-S11'...
,'F:\dataP300\data\BD9\sdataoffline\BD9-19-S21',...
'F:\dataP300\data\BD9\sdataoffline\BD9-19-S31'}, trinum,flanum);

accuracyavg=(accuracy1+accuracy2+accuracy3+accuracy4+accuracy5+accuracy6+accuracy7+accuracy8+accuracy9+accuracy10)/10;
b1=mean(accuracyavg);
% b2=mean(accuracy2);
% b3=mean(accuracy3);
% b4=mean(accuracy4);
x = 1:1:16;
plot(x,accuracyavg.*100,'-ko');
% hold on
% plot(x,accuracy2.*100,'-ks');
% hold on 
% plot(x,accuracy3.*100,'-k+');
% hold on
% plot(x,accuracy4.*100,'-k<');
xlabel('Average Accuracy per Mode');
ylabel('Accuracy (%)');
set(gca,'ylim',[10 110]);
set(gca,'ytick',10:10:110);
set(gca,'xtick',0:1:16);
grid;
