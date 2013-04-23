function accu = crossval(train, apply, data, label)
  % This function, crossval, wraps through all the given data, train and
  % validates the model with data. Finally, the function gives out the
  % accuracy and bit rate of the model.
  %
  % INPUT:
  %	 train - The handle of train function, @model.blda.train, for
  %	         example.
  %      apply - The handle of apply function, @model.blda.apply, for
  %              example.
  %      data  - A cell of matrices with preprocessed data, will be used 
  %	         to train and test (so-called validate) the model.
  %	 label - A cell of matrics with label of data.
  %	 
  % OUTPUT:
  %    results - A cell of matrix that stored the accuracy of the
  %              model.
  %

  function testdata = gettest(data, round)
    % This function, gettest(), returns a matrix of training data
    % which is reshaped into 2-dim: <k * n double>, where n is the
    % number of sampled points in the data.
    testdata = data{round};
    testdata = sqeeze(testdata, util.dim(testdata));
  end

  function traindata = gettrain(data, round)
    % This function, gettrain(), works quite the same way as
    % gettest().
    traindata = cat(util.dim(data{1}), ...
		    data{1:round-1}, ...
		    data{round+1:end});
    traindata = sqeeze(traindata, util.dim(traindata));
  end
	 
  function data = sqeeze(data, dim)
    % This function, sqeeze(), reshap a matrix into 2-dim.
    section = size(data, dim);
    data    = reshape(data, ...
		      util.count(data)/section, ...
		      section);
  end

  
  tests   = length(data);
  acc     = zeros(tests, 1);
  br      = zeros(tests, 1);
  results = {};
  
  % for each round of test
  for round = 1:tests
    % train the model with train data, get a structure of params.
    traindata  = gettrain(data,  round);
    trainlabel = gettrain(label, round);

    param      = train(traindata, trainlabel);
    % and then, apply it with test data and model to get predicted
    % labels for testdata
    testdata   = gettest(data, round);

    results{round} = apply(param, testdata);
    
  end

  accu = util.verify(results, label);
  
end
