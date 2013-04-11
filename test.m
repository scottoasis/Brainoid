%
testcell = {[1 2 3 4], ...
	    [2 3 4 5]};
%	    [3 4 5 6]};
answer   = [7 0; 11, 0];
[a b] = crossval('test.eval', 'test.apply', testcell);
assert(isequal([a b], answer));
