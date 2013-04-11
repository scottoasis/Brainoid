% function electrode defines the mapping rules to electrode name (for
% example, 'Cz') to channel number (say, 2). The script will
% automatically returns a structure, E, which stores all the
% information about the mapping rules. You can simply call
% electrode('Cz') and it will return 2. Or, you can call it with
% multiple arguments, like electrode('Cz', 'Pz', 'Fz') and it will
% return a vector [2 3 1].
%
% You can modify the composition of structure E so that you can make
% it more appliable to your condition.
%
% input arguments: either single string, a cell of strings, or strings
% are valid:
%
% single string   - electrode('Cz')
% cell of strings - electrode({'Cz', 'Fz', 'Pz'})
% strings         - electrode('Cz', 'Fz', 'Fz')
%


function channels = electrodes(varargin)
  E = struct;

  names = varargin;
  if (length(names) == 1) channels = getfield(E, names{1});
  else channels = [electrodes(names{1}) electrodes(names{2:end})];
  end
end
