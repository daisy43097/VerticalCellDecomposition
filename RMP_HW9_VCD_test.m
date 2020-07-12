clear
close all
%% test 1: the same as the lecture note
% bounds=[-10 15 15 -10;-10 -10 10 10];
% CB={[0 2 3 2 0 -1;-7 -7 -5 -3 -3 -5],[0 0 1 2 3 3;3 2 0 0 2 3]};
% qI=[-5;4]; qG=[10;-8];
% qI=[2;8]; qG=[10;-8];
qI=[0.9;-2.5]; qG=[10;-8];
%qI=[-10;0]; qG=[15;0];
 % qI=[-1;2.5]; qG=[3;-7.5];
%% test 2: this test case is a bit tricky
bounds=[0 10 10 0;0 0 4 4];
CB={[1 2 2;2 1 3],[3-1.5 4-1.5 5-1.5 4-1.5;2 1 2 3],[3.3 5 4;1 2 3],[7.3 8 8 7;1 1 3 3]};
%qI=[0.5;0.5]; qG=[11.5;3.5];
%qI=[3;1]; qG=[8.8;1.5];

%% Plot
plot([bounds(1,:),bounds(1,1)],[bounds(2,:),bounds(2,1)]);
axis equal
hold on
for i=1:size(CB,2)
    Cpatch=CB{1,i};
    patch(Cpatch(1,:),Cpatch(2,:),'yellow')
end
%% TODO: implement your vertical cell decomposition algorithm
[V,G,ninit,ngoal] = vertical_cell_decomposition(qI,qG,CB,bounds);

plot(V(1,:),V(2,:),'o','MarkerFaceColor','black')
for i=1:size(G,2)
    for j=1:size(G,2)
        if G(i,j)~=inf&&G(i,j)~=0
            plot([V(1,i),V(1,j)],[V(2,i),V(2,j)],'black')
        end
    end
end

plot(V(1,ninit),V(2,ninit),'d','MarkerFaceColor','green')
plot(V(1,ngoal),V(2,ngoal),'s','MarkerFaceColor','red')

hold off