function [accuracy br]=classresult1(filelist,trinum,flanum)
% clc
%  clear
%channels = [15 20 25]; 

%Fz, Cz, Pz, Oz, T5, P3, P4, T6 
% channel2 = [5 15 25 29 23 24 26 27];                  

% Fz, Cz, Pz, Oz, P7, P3, P4, P8, O1, O2, C3, C4, FC3, FC4, CP3, CP4
% channel3 = [5 15 25 29 23 24 26 27 28 30 14 16 9 11 19 21];

% All electrodes
% channel4 = [1:30];

% channel1 = [6 8 14 24 25 27 29 30]; % wc
%  channel1 = [6 19 24 25 29 30]; % wc2
%  channel1 = [2 10 12 16 21 23 25 27];%jzf
% channels = [12 18 24 25 27 29 30];%jzf2
% channel1 = [6 13 15 17 23 25 29 30]; %zy
% channel1 = [24    28    25    27    23    14    30    21]; %zy
%  channels = [13 14 21 23 25 27 28 30]; %zy3
% clc
% clear
% channel1 = [23    28    25    27    13    14    30    21];

%  channel1 = [23    27    25    28    19    30    21    29];% sub1
%  channel1 = [13 14 21 23 25 27 28 30];%a
channel1 = [1:12];

[accuracy  br]=crossvalidatep3003(filelist,channel1,trinum,flanum);

