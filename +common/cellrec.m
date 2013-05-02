function out = cellrec(bundle, exec, combine)

  if (length(bundle) == 1)
    out = exec(bundle{1});
  else
    out = combine(cellrec({bundle{1}}, exec, combine), ...
		  cellrec({bundle{2:end}}, exec, combine));
  end
end
