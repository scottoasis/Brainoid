  PROG_HOME   = '~/Codes/BCI/brainoid/';
  DATA_HOME   = '~/Data/p300-speller/';
  DATA_PROC   = [DATA_HOME 'processed/'];
  BIOSIG_HOME = '~/Codes/BCI/biosig4octmat/';
  BIOSIG_NAN  = [BIOSIG_HOME 'NaN/'];
  BIOSIG_TSA  = [BIOSIG_HOME 'tsa/'];
  BIOSIG_LIB  = [BIOSIG_HOME 'biosig/'];
  BIOSIG_EEG  = [BIOSIG_LIB 'eeglab/'];
  BIOSIG_T200 = [BIOSIG_LIB 't200/'];
  BIOSIG_T250 = [BIOSIG_LIB 't250/'];

  SEP = filesep;
  

  addpath(PROG_HOME, DATA_HOME, DATA_PROC, BIOSIG_HOME, ...
	  BIOSIG_NAN, BIOSIG_TSA, BIOSIG_LIB, BIOSIG_EEG, ...
	  BIOSIG_T200, BIOSIG_T250);
  
