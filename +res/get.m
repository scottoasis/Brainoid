function data = get(category, fullnames)
  % This function, res.get(), is a helper function to help you retrieve
  % your data.
  % INPUT:
  %	 category  - A string indicates the catagory of the data you want
  %                  to retrive, 'data', or 'electrodes', for example.
  %	 funllname - A formatted string which identifies the detail of the
  %	             data you want. You can find an example in
  %                  +util/strformat.m.
  %
  % if `res.loadpathes` is not ran yet.
  if (~exist('HOME'))
    res.loadpathes;
  end
  data = {};

  switch(category) 
    case {'data'}
      files = common.strformat(fullnames);
      for (f = 1:length(files))
	[d, l]  = res.loaddata(common.pathcat(DATA, files{f}));
	data{f} = {d, l};
      end 
  end
	

	 
end
