function [data, label] = make(varargin)
  % make.m is the main entrance of the whole program. 
  %

  clc
  clear

  %% +RES
  %  First of all, include biosig4octmat package. Then load other
  %  resources, like EEG electrodes definition and raw data we need to
  %  deal with.
  
  %  add load pathes
  res.loadpathes;

  %  load electrode structure
  trinum  = 19;
  flanum  = 2;
  channel = [1:12];

  %  load raw data.
%  rawdata = res.get('data', ...
%		    'AO3/sdataoffline/[AO3-19-S11|AO3-19-S21|AO3-91-S31].mat');
  load(util.pathcat(DATA, 'AO3/sdataoffline/AO3-19-S11.mat'));
  rawdata{1} = runs;
  load(util.pathcat(DATA, 'AO3/sdataoffline/AO3-19-S21.mat'));
  rawdata{2} = runs;
  load(util.pathcat(DATA, 'AO3/sdataoffline/AO3-19-S31.mat'));
  rawdata{3} = runs;
  
  data  = {[]};
  label = {[]};
  windsork  = @(data) prep.applyw(prep.trainw(prep.windsork(), ...
					     data, 0.1), data);
  normalize = @(data) prep.applyn(prep.trainn(prep.normalizen(), ...
					      data, 'z-score'), data); 

  %% +PREP
  %  First, append all the trainning data and labels into 2 large
  %  matrices: data and label. Then go through the pre-processing steps
  %  by applying data to prep.apply(). A normalized and well regulated
  %  data matrix will then be returned as output of prep.apply().
  for set = 1:length(rawdata)
    r = rawdata{set};
    d = []; dimd = util.dim(r{1}.x);
    l = []; diml = util.dim(r{1}.y);
    for run = 1:length(r)
      d = cat(dimd, d, r{run}.x);
      l = cat(diml, l, r{run}.y);
    end
    data{set}  = prep.apply({windsork, normalize}, d);
    label{set} = l;
  end
  





  %% +MODEL
  trainblda = @(data, label) model.blda.train(model.blda.bayesldab(1), ...
					      data, label);
  applyblda = @(model,data) model.blda.apply(model, data);

  results = util.crossval(trainblda, applyblda, data, label);


