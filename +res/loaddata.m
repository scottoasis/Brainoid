function [d,l] = loaddata(filename)
  % This function is an example of difining structure of stored data,
  % and how to reshape raw data into the form/spec to the system can
  % handle. Here comes an example of final output:
  %	 
  % +---------------------- fullset of data -
  % {                                       | 
  %  +---------------- a set of data -      | 
  %  {                               '      |
  %    [0.2, 0.3, 0.2;     |         '      | 
  %	0.3, 0.4, 0.1;     +-> raw   '      | 
  % 	0.2, 0.2, 0.2],    |   data  '      |      
  %	                             '      |
  %    [ 1;                |         '      |       
  %     -1;                +-> label '      |
  %	 1]                |         '      |
  %  }                               '      |        
  %  +--------------------------------      |        
  %	                                    | 
  %  other sets of data ...                 |         
  %	                                    |      
  % }                                       | 
  % +----------------------------------------
  %
  % You should note that this function, loaddata(), generates a set of
  % data, is a cell which composed of two matices: raw-data and labels.
  %	 

  load(filename)

  d = []; l = [];
  dimd = common.dim(runs{1}.x);
  diml = common.dim(runs{1}.y);
  for run = 1:length(runs)
    d = cat(dimd, d, runs{run}.x);
    l = cat(diml, l, runs{run}.y);
  end
end
