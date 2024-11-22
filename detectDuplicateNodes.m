function [hasDuplicate, duplicatePairs] = detectDuplicateNodes(A)
    % A 是图的邻接矩阵
    n = size(A, 1);  % 节点的个数
    hasDuplicate = false;
    duplicatePairs = []; % 存储复制点对
    
    % 遍历邻接矩阵的每对行，检查它们是否相同
    for i = 1:n
        for j = i+1:n
            if isequal(A(i, :), A(j, :)) % 比较第i行和第j行
                hasDuplicate = true;
                duplicatePairs = [duplicatePairs; i, j];
            end
        end
    end
end
