function str = capitalize(str)
  % A helper function to capitalize string.
  % INPUT:
  %	 str - string to be capitalized.
  %

  str = [str(1) - 32 str(2:end)];
