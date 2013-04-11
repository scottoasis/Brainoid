% make.m is the main entrance of the whole program. 
%

clc
clear

%% add load pathes

% loaddir loads all the necessary directories. please use function 
% utils.pathcat(PATH_1, PATH_2, ...) to concate the firectory path.

% load all the directories
addpath(PROG_HOME, DATA_HOME, DATA_PROC, BIOSIG_HOME, ...
	BIOSIG_LIB, BIOSIG_NAN, BIOSIG_EEG, BIOSIG_T200, ...
	BIOSIG_T250,BIOSIG_TSA);



% load electrode structure
electrodes;

channel = electrodes('Fz', 'Cz', 'Pz', 'Oz', 'O1', 'O2', ...
		     'P7', 'P3', 'P4', 'P8', 'C3', 'C4');
trinum  = 19;
flanum  = 2;

[accuracy1 br] = models.blda.crossvalidatep3003( ...
		  {[DATA_HOME_PATH 'AO3' SEP 'sdataoffline' SEP 'AO3-19-S11'],
		   [DATA_HOME_PATH 'AO3' SEP 'sdataoffline' SEP 'AO3-19-S21'],
		   [DATA_HOME_PATH 'AO3' SEP 'sdataoffline' SEP 'AO3-19-S31']}, ...
		  channel, trinum, flanum);
