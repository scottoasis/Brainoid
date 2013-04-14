function [accuracy br] = crossvalidatep3003(filelist, channels, trinum, flanum)

  % crossvalidate(filelist)
  % 
  % Uses n - 1 of the n files in *filelist* to build a classifier and tests the 
  % classifier on the left-out file. This is done once for each file and 
  % results are averaged. Average classification accuracy and bitrate are plotted.
  % The files in *filelist* have to be built with extract trials.
  %
  % Example: crossvalidate({'s1','s2','s3','s4'})


  %% do the crossvalidation
  n_correct = zeros(length(filelist), 16);

  %% 
  for i = 1:length(filelist)

    trainingfiles    = filelist;
    trainingfiles(i) = [];
    
    n_correct(i,:) = testclassificationp3001(trainingfiles, filelist{i}, ...
					     channels,trinum,flanum) ;
  end


  %% plotting results
  accuracy = mean(n_correct) / 5;   % each file contains six runs
  a  = mean(accuracy);
  br = bitrate(accuracy, trinum);
  x  = 1:1:16;

  ax = plotyy(x, 100 * accuracy, x, br);
  set(ax(1), 'ylim',  [10 100]);
  set(ax(2), 'ylim',  [0 50]);
  set(ax(1), 'ytick', 10:10:100);
  set(ax(2), 'ytick', 0:5:50);
  
  set(get(ax(1), 'ylabel'), 'String', 'Accuracy (%)');
  set(get(ax(2), 'ylabel'), 'String', 'Bitrate (bits/min)');
  
  set(ax(1), 'xlim',  [0 16]);
  set(ax(2), 'xlim',  [0 16]);
  set(ax(1), 'xtick', 1:1:16);
  set(ax(2), 'xtick', 1:1:16);

  % (1.225s for one run, the time used to recognize one
  % character = average times of runs*1.225)');
  xlabel('Trials per average')
  grid;
  



  %% function to compute bits / min from classification accuracy
  function br = bitrate(accuracy,trinum)

    for i = 1:length(accuracy)
      if accuracy(i) > 0 && accuracy(i) < 1
	br(i) = log2(84) + accuracy(i)*log2(accuracy(i)) + ...
		(1-accuracy(i))*log2((1-accuracy(i))/83); 
      end
      if accuracy(i) == 0
        br(i) = 0;
      end
      if accuracy(i) == 1
        br(i) = log2(82);
      end
    end
    if trinum==19
      br = br*60./(3.325:3.325:53.2);
    end%19
    if trinum==16
      br = br*60./(2.8:2.8:44.8);
    end%16
    if trinum==14
      br = br*60./(2.45:2.45:39.2);%14
    end
    if trinum==12
      br = br*60./(2.1:2.1:33.6);%12
    end
    if trinum==9
      br = br*60./(1.575:1.575:25.2);%9
    end
