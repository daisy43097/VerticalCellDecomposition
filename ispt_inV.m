function b = ispt_inV(q, V)
for i = 1:size(V,2)
    if q == V(:,i)
        r(i) = all(q == V(:,i));
    else
        r(i) = 0;
    end
end 
if find(r==1)
    b = 1;
else 
    b = 0;
end 
