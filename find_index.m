function i = find_index(q, V)
[~,c] = find(V == q);
if size(c,1) ==2
    i = c(1);
else
    uniqueX = unique(c);
    countOfX = hist(c,uniqueX);
    indexToRepeatedValue = (countOfX~=1);
    i = uniqueX(indexToRepeatedValue);
end
