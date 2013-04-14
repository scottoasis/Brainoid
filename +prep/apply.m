function data = apply(proceds, data)
  % This function, prep.apply, will do all the preprocessing work for
  % you. What you have to do is pass a cell of names of procedures and
  % a matrix which contains data to be processed.
  % INPUT:
  %	 proceds - a cell of names (as string) of procedures to apply
  %	           on data. 
  %  	 data    - a matrix of data to be processed.
  % OUTPUT:
  %	 data    - a matrix of data, after processing.

  if (length(proceds) == 1)
    % if there is only one procedure, just apply the procedure to the
    % data and return it.
    % data = feval(proceds{1}, data);
    data = data;
  else
    % if there is more than one procedure, apply the first one and
    % then its successors.
    data =  prep.apply({proceds{2:end}}, ...
		       prep.apply({proceds{1}}, data));
  end
end
