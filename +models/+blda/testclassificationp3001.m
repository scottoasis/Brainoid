function n_correct = testclassificationp3001(trainingfiles, testfile, channels, trinum, flanum)
  %
  % testclassification(trainingfiles, testfile)
  %
  % Uses the data in *trainingfiles* to build a classifier and tests
  % the classifier on the data in *testfile*. *n_correct* contains for
  % each number of blocks (1-20) the number of correctly classified
  % items. If no output arguments are given *n_correct* is plotted.
  % The training files and the test file have to be built with
  % extracttrials.
  %
  % Example: testclassification({'s2','s3','s4'},'s1')

  % Author: Ulrich Hoffmann - EPFL, 2006
  % Copyright: Ulrich Hoffmann - EPFL


  %% subsets of electrodes
  channels = [1:12];


  x = []; y = [];
  %% load training files and concatenate data and labels into two big
  %% arrays
  
  for i = 1:length(trainingfiles);
    fprintf('loading %s\n', trainingfiles{i});
    % load i-th training sample to var f.
    f = load(trainingfiles{i});
    n_runs = length(f.runs);

    %% function cat concates ARRAY_LIST with given DIM:
    %  cat(DIM, ARRAY_LIST)
    %
    %  Here, f.runs{j}.x is the EEG (amplitude) data of j-th run in
    %  i-th training file.
    %  The main purpose of concating is to load all the training data into
    %  two big arrays: x and y
    for j = 1:n_runs;
      x = cat(3, x, f.runs{j}.x);
      y= [y f.runs{j}.y];
    end

  end
  %% Finally, all the data in *trainingfiles* are concated into two big arrays:
  %  - x: EEG data array, with DIM
  %    <n_channels, n_trials, n_epoches * n_trianingfiles>
  %
  %  - y: EEG 'is-target?' label array, with DIM
  %    <n, n_epoches * n_trainingfiles>
  

  %% select channels
  x = x(channels, :, :);
  %% windsorize
  w = windsork;
  w = trainw(w,x,0.1);
  x = applyw(w,x);
  %% normalize
  n = normalizen;
  n = trainn(n,x,'z-score');
  x = applyn(n,x);

  n_channels = length(channels);
  n_samples  = size(x,2);
  n_trials   = size(x,3);

  %% functio reshape modifies the dimention of given ARRAY with given DIM_ARRAY:
  %  reshape(ARRAY, DIM_ARRAY) = reshape(ARRAY, DIM_X, DIM_Y, ...)
  %  prod(DIM_ARRAY) = prod(size(ARRAY)) must be agreed.
  %
  %  
  x = reshape(x, n_samples * n_channels, n_trials);
  tnan = isnan(x);
  x(tnan) = 0;
  clear tnan;

  %% bayesian lda
  b = bayesldab(1);
  b = trainbye(b,x,y);


  %% validates training
  clear y
  f = load(testfile);
  n_runs = length(f.runs);
  n_blocks = 16;
  a1 = zeros;
  a2 = zeros;
  n_correct = zeros(1,n_blocks);
  
  for i = 1:n_runs
    x = f.runs{i}.x(channels, :, :);
    x = applyw(w, x);
    x = applyn(n, x);
    n_trials = size(x, 3);
    x = reshape(x, n_channels*n_samples, n_trials);
    tnan=isnan(x);
    x(tnan) = 100;
    clear tnan;
    y = classifybye(b, x);
    scores = zeros(1, trinum);
    
    for j = 1:n_blocks
      corr1 = 0;
      start = (j - 1) * trinum+1;
      stop  = (j) * trinum;
      scores(1:trinum) = scores(1:trinum) + y(start:stop);
      [a1 a2] = sort(scores);
      a2 = a2 + 31;
      
      for ta1 = 1:flanum
        for ta2 = 1:flanum
	    
          if a2(1, trinum + 1 - ta2) == f.runs{i}.target(1, ta1)
            corr1 = corr1 + 1;
          end
	  
        end
      end
      
      if corr1 == flanum;
        n_correct(j) = n_correct(j) + 1;
      end
      
    end
  end
  
  %% if no output arguments plot the results
  if nargout == 0
    plot(n_correct);
    axis([1 10 0 16]);
    xlabel('Number of blocks');
    ylabel('Number of correct classifications');
  end
