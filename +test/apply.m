function varargout = apply(varargin)
  % This function, test.apply, provides a scenario for testing
  % function crossval. This can also serves as an example of testing
  % in brainoid. This function provides two functionalities: to
  % generate a parameter structure for mock/fake model, 'test', or to
  % test this mock model with given parameter structure and test data.
  % INPUTS:
  %	 no argument   - init an empty params matrixfor this model.
  %	 two arguments - init a model with given params and test the
  % 			 model under given test data.
  %	     - params  - trained params of mock model.
  %	     - data    - test data for the mock model.
  %
  if (nargin == 0)
    % init an empty params structure
    m = struct;
    m.match = 0;
    varargout{1} = m;
    
  elseif (nargin == 2)
    % init a model with varargin{1} and test it with varargin{2}.
    params = varargin{1};
    data   = varargin{2};
    m = params;
    data(find(data == m.match)) = 0;
    varargout{1} = sum(data);
    varargout{2} = prod(data);
  else
    % invalid inputs. raise an exception and exit.
    fprintf('Error: the number of your input arguments are invalid: %d\n', nargin);
    return;
  end
  
end
  
