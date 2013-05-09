function leveltree(varargin)
  function a_tree
    assert(isequal(leveltree({'a'}), ...
		   {'a'} ));
  end

  function a_bc_tree
    assert(isequal(leveltree({'a', {'b', 'c'}}), ...
		   {'ab', 'ac'} ));
  end

  function ab_c_tree
    assert(isequal(leveltree({{'a', 'b'}, 'c'}), ...
		   {'ac', 'bc'} ));
  end

  function ab_cd_tree
    assert(isequal(leveltree({'a', 'b'}, {'c', 'd'}), ...
		   {'ac', 'bc', 'ad', 'bd'} ));
  end

  
  a_tree();
  a_bc_tree();
  ab_c_tree();
  ab_cd_tree();
end
