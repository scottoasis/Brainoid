function total = count(x, varargin)
  % This function, count(), counts how many elements there is in
  % matrix x. You can also apply a function handler f, together with
  % x. Thus you can count how many elements in x which satisfies f.
  % INPUTS:
  %	 x - A matrix, to be counted.
  %	 f - A function handler, usually a anonymous function which
  %	     indicates how the elements in x is counted.
  %	 
	 
  if (nargin == 1)
    total = prod(size(x));
  else
    f = varargin{1};
    total = common.count(f(x));
  end

end
