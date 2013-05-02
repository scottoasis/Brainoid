function full_path = pathcat(path, subpath, varargin)

% This function, pathcat(args) concates the input string array.
% you can use it in this way:
%    utils.pathcat(PATH_1, PATH_2, ..., PATH_N)
%
% it will automatically return a string in a concated way:
%    'PATH_1/PATH_2/.../PATH_N'
%
% Author: scott wang
%
  if (length(varargin) ==  0)
      full_path = [path filesep subpath];
  else
      full_path = util.pathcat(util.pathcat(path, subpath), ...
			       varargin{1}, varargin{2:end});
  end
  
end
