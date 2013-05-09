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
      full_path = strcat(path, filesep, subpath);
  else
      pathes = varargin;
      full_path = pathcat(pathcat(path, subpath), ...
			  pathes{1}, pathes{2:end});
  end
  
end
