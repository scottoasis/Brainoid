%% function to compute bits / min from classification accuracy
function br = bitrate(accuracy,trinum)

  for i = 1:length(accuracy)
    if accuracy(i) > 0 && accuracy(i) < 1
      br(i) = log2(84) + accuracy(i)*log2(accuracy(i)) + ...
	      (1-accuracy(i))*log2((1-accuracy(i))/83); 
    end
    if accuracy(i) == 0
      br(i) = 0;
    end
    if accuracy(i) == 1
      br(i) = log2(82);
    end
  end
  if trinum==19
    br = br*60./(3.325:3.325:53.2);
  end%19
  if trinum==16
    br = br*60./(2.8:2.8:44.8);
  end%16
  if trinum==14
    br = br*60./(2.45:2.45:39.2);%14
  end
  if trinum==12
    br = br*60./(2.1:2.1:33.6);%12
  end
  if trinum==9
    br = br*60./(1.575:1.575:25.2);%9
  end

end
