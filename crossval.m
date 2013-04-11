function [acc br] = crossval(eval, apply, data)
  % This function, crossval, wraps through all the given data, train and
  % validates the model with data. Finally, the function gives out the
  % accuracy and bit rate of the model.
  %
  % INPUT:
  %	 eval  - A string which indicates the full name of the eval
  %              function, 'model.blda.eval', for example.
  %      apply - A string which indicates the full name of the apply
  %	         function, 'model.blda.apply', for example.
  %      data  - A cell of matrics with preprocessed data, will be used 
  %	         to train and test (so-called validate) the model.
  % OUTPUT:
  %      acc   - A matrix that stored the accuracy of the model.
  %	 br    - A matrix that stored the bit-rate of the model.
  %
	 
  rounds = length(data);
  acc    = zeros(rounds, 1);
  br     = zeros(rounds, 1);
  DIM    = dim(data);
  
  % for each test
  for test = 1:rounds
    % eval the model with train data, get a structure of params.
    traindata = cat(DIM, data{1:test -1}, data{test + 1:end});
    params    = feval(eval, traindata);
    % and then, apply it with test data and params to get predicted
    % labels for testdata
    testdata  = cat(DIM, data{test});
    [a b]     = feval(apply, params, testdata);
    % and finally, concate the accuracy and bit rates together
    acc(test) = a;
    br(test)  = b;
  end
  
end
