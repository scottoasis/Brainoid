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

  % if there is only one procedure to be applied on data, and this
  % procedure is may be passed in not in a cell, like `@prod`, then
  % simply apply it to data;
  if(~iscell(proceds))
    data = proceds(data);
  % or if there is only one procedure, but it is included in a cell,
  % like `{@prod}`, take it out and apply it.
  elseif (length(proceds) == 1)
    data = proceds{1}(data);
  % or for the last senario which has several procedures, included in
  % a cell, like `{@prod, @sum}`, then apply them one-by-one.
  else
    data =  prep.apply({proceds{2:end}}, ...
		       prep.apply({proceds{1}}, data));
  end
end
