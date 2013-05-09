function assertequal(tobetest, expect, varargin)
  % INPUT:
  %	 tobetest - A expression of the value to be tested.
  %	 expect   - A expression of the expected value.
  %      comment  - OPTIONAL. A String of the name/notation of the
  %                 test.
  %

  function getcomment	 
    if (nargin > 2)
      comment = varargin{1};
    else
      comment = tostr();
    end
  end

  function name = tostr()
    name = 'A';
  end
  
  function testequality()
    if (isequal(tobetest, expect))
      successful();
    else
      disp('[FAILD] ');
      throw(comment);
    end
  end

  function throw(exception)
  end

  function successful()
    fprintf('[SUCCESSFUL] %s', comment);
  end
  
  getcomment();
  testequality();
end
