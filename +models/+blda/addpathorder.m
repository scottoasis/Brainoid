% this file provides loadpath for biosig lib, data source, and
% programm sources.

DATA_HOME_PATH   = '~/Data/p300-speller/';
PROG_HOME_PATH   = '~/Codes/BCI/';
BIOSIG_HOME_PATH = [PROG_HOME_PATH 'biosig4octmat/'];

% var sep represents the system seperater:
% "\" for windows, "/" for unix-like.
SEP = filesep;

addpath([BIOSIG_HOME_PATH 'biosig']);
addpath([BIOSIG_HOME_PATH 'biosig' SEP 'eeglab']);
addpath([BIOSIG_HOME_PATH 'biosig' SEP 't200']);
addpath([BIOSIG_HOME_PATH 'biosig' SEP 't250']);
addpath([BIOSIG_HOME_PATH 'tsa']);
addpath([BIOSIG_HOME_PATH 'NaN']);

