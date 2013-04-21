function verify
  id = @(x) x;
  istrue = @(x) find(x == 1);
  
  assert(isequal(verify({ones(3)}, {ones(3)}),  {1}));
  assert(isequal(verify({ones(3)}, {zeros(3)}), {0}));
end
