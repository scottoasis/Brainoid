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
	 
  rounds  = length(data);
  acc     = zeros(rounds, 1);
  br      = zeros(rounds, 1);
  result  = {};
  
  % for each round of test
  for test = 1:rounds
    % train the model with train data, get a structure of params.
    traindata  = cat(util.dim(data{1}), ...
		     data{1:test -1}, ...
		     data{test + 1:end});
    points     = size(traindata, 3);
    traindata  = reshape(traindata, ...
			 util.count(traindata)/points, ...
			 points);

    trainlabel = cat(util.dim(label{1}), ...
		     label{1:test-1}, ...
		     label{test+1:end});
    trainlabel = reshape(trainlabel, ...
			 util.count(trainlabel)/points, ...
			 points);
    size(traindata)
    size(trainlabel)
    model      = train(traindata, trainlabel);
    % and then, apply it with test data and model to get predicted
    % labels for testdata
    testdata   = data{test};
    testdata   = reshape(testdata, ...
			 util.count(testdata)/points, ...
			 points);
    
    result{test} = apply(model, testdata);
  end

  accu = util.verify(result, label);
  
end
