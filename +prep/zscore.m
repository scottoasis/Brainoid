function x = zscore(x);

  normalizer = prep.normalizen();
  
  n_channels = size(x,1);
  n_samples  = size(x,2);
  n_trials   = size(x,3);
  x = reshape(x, n_channels,n_samples * n_trials);

  n.mean = mean(x,2);
  n.std = (std(x'))';
  n.method = 'z-score';        

end
