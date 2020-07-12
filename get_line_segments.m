% get obstacles segments from left endpts(1:2) to right endpts(3:4) in CCW
function S = get_line_segments(CB)
[~,c] = size(CB);
S = [];
for i = 1:c
    obs = CB{1,i};
    P = get_line_segments_onepoly(obs);
    S = [S P];
end
end


