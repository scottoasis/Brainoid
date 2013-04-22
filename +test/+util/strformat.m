function strformat

  function simpletest
    s = 'this is simple';
    t = strformat(s);
    assert(isequal(s, t));
  end

  function paralel
    s = 'this one has [first|second] argument';
    t = strformat(s);
    assert(isequal(t, {'this one has first argument', ...
		       'this one has second argument'}));
  end

  function multiarg
    s = 'this time ';
    p = 'we have more than one arg';
    t = strformat(s, p);
    assert(isequal(t, strcat(s, p)));
  end

  % {
  % model:
  % [one|two[three]]      -> [one|twothree]
  % [one|two|[three]]     -> [one|two|three]
  % [one|[two|three]]     -> [one|two|tree]
  % [one[two|tree]]       -> one[two|three]
  % [one|two[three|four]] -> [one|twothree|twofour]
  %
  function concated
    s = 'this [one |has [several |concated ]] argument.'
    p = {'this one argument', ...
	 'this has several argument', ...
	 'this has concated argument'};
    assert(isequal(p, strcat(s)));
  end
  % }

  function basic
    simpletest;
    paralel;
  end
  
end
