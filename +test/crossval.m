function crossval(varargin)
  % This function, test.crossval(), provides a scenario for testing
  % function crossval. This file is also provided as an example of
  % unit testing in Brainoid. This function provides generate mock
  % data (aka fixtures) for testing and then test if the crossval()
  % function matches our expectation.
  %	 
  % You can call test.crossval() with an argument to let the function
  % specify the tests to go through, a cell of strings, 'uprun' for
  % example.
  %
  % INPUT:
  %	 no argument  - run the full sets of tests.
  %    multi argument - run the tests in the argument list one-by-one.
  %	                tests - a string, the name of the test function,
  %                     'uprun' for example.
	 
  %% DEF MOCK DATA
  simpledata  = {ones(4), zeros(4), magic(4)};
  simplelabel = {[1 0] [1 0] [1 0]};

  complexdata = res.get();

  % This mock function onesandzeros() will return fixed values [1, 1,
  % ..., 1] and [0, 0, ..., 0] as the result of applying data on
  % model.
  function result = onesandzeros(model, data)
    data(find(data == model.match)) = 0;
    result = [1 0];
  end

  % This mock function matches() will retrn a model-parameter
  % (structure) with field match  equals 3.
  function model = matchthree(data, varargin)
    model.match = 3;
  end
  

  %% Define tests
  % This test function, uprun() tests if the target function,
  % crossval() is up and running. If the function works, it will
  % return ones and zeros.
  function uprun()
    acc = crossval(@matchthree, @onesandzeros, simpledata, simplelabel);
  end

  if (nargin >= 1)
    % if there is any test specification, then go through the tests
    % one-by-one.
    tests = varargin;
    eval(tests{1});
    if (nargin > 1)
      test.crossval(tests{2:end});
    end
  else
    % if there is no arguments to sepecify tests, then by default we go
    % through all tests here;
    uprun;
  end
    
end
