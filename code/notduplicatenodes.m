function matrix = notduplicatenodes(C)
    matrix={};
    for i = 1:numel(C)
        if iscell(C{i})
            for j = 1:numel(C{i})
                [A,B] = detectDuplicateNodes(C{i}{j});
                if A == 0
                matrix = [matrix,C{i}{j}];
                end
            end    
        else
            [A,B] = detectDuplicateNodes(C{i});
            if A == 0
                matrix = [matrix,C{i}];
            end
        end
    end
end