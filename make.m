function make(varargin)
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
  rawdata = res.get('data', {'AO3', ...
			     'sdataoffline', ...
			     {'AO3-19-S11', 'AO3-19-S21', 'AO3-91-S31'}});

  %% +PREP
  %  First, append all the trainning data and labels into 2 large
  %  matrices: data and label. Then go through the pre-processing steps
  %  by applying data to prep.apply(). A normalized and well regulated
  %  data matrix will then be returned as output of prep.apply().
  data = 
  data = prep.apply({@prep.windsorize, @prep.zscore}, data);




  %% +MODEL
  results = crossval(@model.blda.trainbye, @classifybye, data, label);


end


