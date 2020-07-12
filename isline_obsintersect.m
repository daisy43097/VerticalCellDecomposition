function b = isline_obsintersect(s1, O)
for i = 1:size(O,2)
    s2 = O(:,i);
    r(i) = is2line_intersect(s1,s2);
    if find(r==1)
        b=1;     
    else
        b=0;
    end
end 

function b = is2line_intersect(s1,s2)
x = [s1(1,1) s1(3,1) s2(1,1) s2(3,1)];
y = [s1(2,1) s1(4,1) s2(2,1) s2(4,1)];
dt1=det([1,1,1;x(1),x(2),x(3);y(1),y(2),y(3)])*det([1,1,1;x(1),x(2),x(4);y(1),y(2),y(4)]);
dt2=det([1,1,1;x(1),x(3),x(4);y(1),y(3),y(4)])*det([1,1,1;x(2),x(3),x(4);y(2),y(3),y(4)]);
if(dt1<=0 && dt2<=0)
    b=1;      %If lines intesect
else
    b=0;
end