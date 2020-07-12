function P = get_line_segments_onepoly(obs)
P = [];
obs = [obs obs(:,1)];
for j = 1:size(obs,2)-1
    if obs(1,j) < obs(1,j+1)
        P = [P [obs(:,j);obs(:,j+1)]];
    else
        P = [P [obs(:,j+1);obs(:,j)]];
    end
end
end