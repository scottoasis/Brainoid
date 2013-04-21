function cat = leveltree(varargin)
  % This function, leveltree(), is a helper function to to expand
  % leveled tree into flattern cell array. For example, it can concate
  % SEQ = '~/', 'Data/', 'tests/', 'AOZ-3', {'1', '2', '3'}, '.m' into
  % ANS = {'~/Data/tests/AOZ-31.m',
  %        '~/Data/tests/AOZ-32.m',	 
  %        '~/Data/tests/AOZ-33.m'}
  % INPUT
  %	 levels - Sequence of tree level, just like the SEQ in former
  %	          example.
  % OUTPUT
  %	 cat    - A cell of concated strings, just like the ANS in
  %	          former example.
  %
  % WARNING: You SHOULD aware that this function is NOT well-structed.
  %          Even though it works, it needs improvement, to be
  %          implemented in a more elegent way.
  %	 
  function result = comb(x, y, varargin)
    if (nargin == 2) result = {};
      if (~iscell(x) == 1) x = {x}; end
      if (~iscell(y) == 1) y = {y}; end

      for i = 1:length(x)
	for j = 1:length(y)
	  result{i, j} = [x{i}, y{j}];
	end
      end
      result = reshape(result, 1, count(result));
      
    else
      result = comb(comb(x, y), varargin{1:end});
    end
  end

	 
  if (nargin == 1)
    if ~iscell(varargin{1})
      cat = {varargin{1}};
    else
      cat = varargin{1};
    end
  else
    children = varargin{end};
    parents  = varargin{end-1};
    out = comb(parents, children);
    if ~iscell(out) out = {out}; end
    cat = leveltree(varargin{1:end-2}, out);
  end
end
