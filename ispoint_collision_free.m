function b = ispoint_collision_free(q, O)
[~,c] = size(O);
for j = 1:c
    Q = O{1,j};
    r(j) = ispoint_collision_free_onepolygon(q, Q);
end 
if find(r==0)
    b = false;
else 
    b = true;
end
end 

function b = ispoint_collision_free_onepolygon(q, Q)
    xv = Q(1,:);
    yv = Q(2,:);
    [in, on] = inpolygon(q(1),q(2),xv,yv);
    if in ~= 1 && on ~= 1
        b = true;
    else 
        b = false;
    end
end 

