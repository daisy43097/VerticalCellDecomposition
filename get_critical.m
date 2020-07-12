function x = get_critical(CB, bounds)
p = [];
[~,c] = size(CB);
for i = 1:c
    p = [p [CB{1,i}]];
end 
p = [p bounds];
p = reorder(p,1);
x = p(1,:);
    