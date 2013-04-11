function params = eval(data)
  % This function, test.eval, provides a scenario for testing function
  % crossval. This can also serves as an example of testing in
  % brainoid. This function trains a mock model, 'test', then returns
  % a parameter structure of that model, which is trained under given
  % data.
  % INPUTS:
  %	 data - the training data for 'test'.
  %
  m = test.apply();
  m.match = 3;
  params = m;
