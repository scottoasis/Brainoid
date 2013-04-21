function data = fixture(varargin)
  % if no target module specified, or an 'all' module is indicated,
  if (nargin == 0 || varargin{1} == 'all')
    % then use all sets of mock data;
  % if there is only one module specified,
  elseif (nargin == 1)
    % then 
    eval(varargin{1});
  else
  % if there is more than one modules specified
  end
  
  function data = up
    data = {ones(1, 3), zeros(1, 3), ones(1,3)};
  end

  function data = wrap
    data = {};
  end

  
end
