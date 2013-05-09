function accu = verify(predic, label, varargin)
  % This function, veryfy(), calculates the the accuracy (consistency)
  % of predicted results in terms of given labels.
  % INPUT:
  %	 predic - A cell of matrices of pridicted results.
  %	 label  - A cell of matrices of given labels.
  %	 map    - A function which indicates how to verify if `predic`
  %	          and given `label` are identical.
  %	 
  % NOTE that predic and label must in same dimension.
  %	 
  tests  = length(predic);
  accu   = {};
  istrue = @(x) find(x == 1);
  id     = @(x) x;
  if (nargin == 2)
    map = id;
  else
    map = varargin{1};
  end
  
  for test = 1:tests
    similarity = map(predic{test}) == label{test};
    accu{test} = count(similarity, istrue) / ...
		 count(similarity, id);
  end
end
