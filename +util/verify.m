function accu = verify(predic, label)
  % This function, veryfy(), calculates the the accuracy (consistency)
  % of predicted results in terms of given labels.
  % INPUT:
  %	 predic - A cell of matrices of pridicted results.
  %	 label  - A cell of matrices of given labels.
  % NOTE that predic and label must in same dimension.
  %	 
  tests  = length(predic);
  accu   = {};
  istrue = @(x) find(x == 1);
  total  = @(x) x;
  for test = 1:tests
    similarity = predic{test} == label{test};
    accu{test} = util.count(similarity, istrue) / ...
		 util.count(similarity, total);
  end
end
