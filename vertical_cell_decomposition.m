function [V, G, n_init, n_goal, E] = vertical_cell_decomposition(qI, qG, CB, bounds)
O = get_line_segments(CB); % get the obstacles line segments 
B = get_line_segments_onepoly(bounds); % get the bounds line segments
S = [O B]; % all line segments stored 
r = reorder(S, 1); % reorder line segments based on x cooidinates of left endpts
x = unique(get_critical(CB, bounds)); % critical x coordiantes 
L = []; % initialize empty list L for active edges 
V = []; % initialize empty set of vertices for graph
for i = 1:size(x,2)
    [~,Iin] = find(r(1,:) == x(i)); % edges to be inserted
    L = [L r(:,Iin)]; % insert edges 
    L = reorder(L,4);
    intersection = [];
    for j = 1:size(L,2)
        if L(1,j) ~= L(3,j)
            intersection = [intersection interp1(L([1,3],j),L([2,4],j),x(i))];
            intersection = rmmissing(intersection);
        end 
    end 
    inter = unique(intersection);
    mid = [];
    for k = 1:size(inter,2)-1
        mid = [mid (inter(1,k)+inter(1,k+1))/2];
    end 
    p = [];
    for n = 1:size(mid,2)
        p = [p [x(i);mid(1,n)]];
    end
    node = [];
    for m = 1:size(p,2)
        if ispoint_collision_free(p(:,m), CB)
            node = [node p(:,m)];
        end
    end
    L(:,L(3,:)==x(i)) = []; % delete leaving edges
    V = [V node];
end
if ispt_inV(qI, V) == 0
    V = [qI V];
end 
if ispt_inV(qG, V) == 0
    V = [V qG];
end
V = reorder(V,1); % all vertices in the graph including qI qG
c = unique(V(1,:)); % x_coordinates of 
EI = []; % create empty edge set for the graph
E = [];
weights = [];
for q = 1:size(c,2)-1
        current = V(:,V(1,:) == c(1,q));
        next = V(:,V(1,:) == c(1,q+1));
        for s = 1:size(current,2)
            for t = 1:size(next,2)
                if isline_obsintersect([current(:,s);next(:,t)], O)==0
                    E = [E [current(:,s);next(:,t)]];
                    EI = [EI [find_index(current(:,s),V);find_index(next(:,t),V)]];
                    weights = [weights dist(current(:,s),next(:,t))];
                end
                
            end
        end 
end 
n_nodes = size(V,2);
G = ones(n_nodes)*Inf;
for i = 1 : n_nodes
    G(i,i) = 0;
end
for i = 1:size(EI,2)
    G(EI(1,i),EI(2,i)) = weights(i);
    G(EI(2,i),EI(1,i)) = weights(i);
end 
n_init = find_index(qI, V);
n_goal = find_index(qG, V);