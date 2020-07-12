function r =  reorder(S, a)
[~, I] = sort(S(a,:));
r = S(:,I);
end 
