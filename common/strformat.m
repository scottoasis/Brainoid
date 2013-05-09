function bundle = strformat(str)

  % {{{ splitAtFirst() splits given `seq` at the first point that
  % matches `note`
  function [former, latter] = splitAtFirst(seq, note)
    nodes  = find(seq == note);
    if (~isempty(nodes))
      former = seq(1 : nodes(1) - 1);
      latter = seq(nodes(1) + 1 : end);
    else
      former = [];
      latter = seq;
    end
  end
  % }}}

  % {{{ span() splits given `str` with symbol `open` and `close`
  function [former, branches, latter] = span(str, open, close)
    [former, after] = splitAtFirst(str, open);
    [br, latter]    = splitAtFirst(after, close);
    branches        = split(br, '|');
  end
  % }}}

  % {{{ split(0 splites given `seq` with `note`, returns a cell of
  % `branches`
  function branches = split(seq, note)
    [before, after] = splitAtFirst(seq, note);
    if (~isempty(before))
      nextBranch = split(after, note);
      branches = {before, nextBranch{:}};
    else
      branches = {after};
    end
  end
  % }}}

  if isempty(find(str == '['))
     bundle = str;
  else 
    bundle = {};
    [former, branches, latter] = span(str, '[', ']');
    
    for (branch = 1:length(branches))
      bundle{branch} = [strformat(former), ...
			strformat(branches{branch}), ...
			strformat(latter), ''];
    end
  end
  
end

%% Example:
%  strformat('a simple test of [this|that].'
