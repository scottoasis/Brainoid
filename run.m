function accu = run(module)
  % make.m is the main entrance of the whole program. 
  %
	 	 

  clear

  % {{{ +RES
  % First of all, include biosig4octmat package. Then load other
  % resources, like EEG electrodes definition and raw data we need to
  % deal with.
  
  %  add load pathes
  res.loadpathes;

  % load electrode structure
  %  trinum  = 19;
  %  flanum  = 2;
  %  channel = [1:12];

  %  load raw data.
  bundles   = res.get('data', 'AO3/sdataoffline/AO3-19-S[1|2|3]1.mat');
  data      = {[]};
  label     = {[]};
  
  windsork  = @(data) prep.applyw(prep.trainw(prep.windsork(), data, 0.1), data);
  normalize = @(data) prep.applyn(prep.trainn(prep.normalizen(), data, 'z-score'), data); 

  % }}} +RES end.
  
  % {{{ +PREP
  for set = 1:length(bundles)
    data_label = bundles{set};
    data{set}  = prep.apply({windsork, normalize}, data_label{1})
    label{set} = data_label{2};
  end
  % }}} +PREP end.
  
  % {{{ +MODEL
  trainblda = @(data, label) model.blda.train(model.blda.bayesldab(1), data, label);
  applyblda = @model.blda.classifybye;

  accu = crossval(trainblda, applyblda, data, label);
  % }}} +MODEL end.

end
