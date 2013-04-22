function data = get(category, fullname)
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
  if (~exist(HOME))
    res.loadpathes;
  end
  

	 
end
