function out = strformat(s, varargin)
  % This function

  function depth = stack(in, depth)
    if (in == ']' && depth ~= 0)
      depth = depth - 1;
    elseif (in == ']')
      depth = -2;
    elseif (in == '[')
      depth = depth + 1;
    end
  end

  t   = strcat(s);
  out = {};
  lbrace = find(t == '[');

  if (isempty(lbrace))
    out{1} = t;
  else
    rbrace  = find(t == ']');
    paralel = t(lbrace(1)+1 : rbrace(end)-1);
    paralel = strformat(paralel);

    depth = 0
    for char = 1:length(t)
      depth = stack(t(char), depth);
      if (depth >= 1)
	strformat(t(char:end)
  end


%%
% origin    -> [one|two|[three|four][five|six]]
% split '[' ->  one|two| three|four] five|six]]
% split ']' ->  one|two| three|four  five|six
% should be -> [one|two|treefive|threesix|fourfive|foursix]

%
% origin    -> [one|two]three[four|five]
% split '[' ->  one|two]three four|five]
% split ']' ->  one|two three four|five

% basic struct
% [one|two]        -> [one|two]
% [one|two]three   -> [onethree|twothree]
% [one|[two|tree]] -> [one|two|three]

end
