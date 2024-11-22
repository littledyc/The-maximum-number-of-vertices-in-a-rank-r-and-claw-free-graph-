function adjMatrices = generateAllGraphs(n)
    % 计算无向图的边数
    numEdges = n * (n - 1) / 2;
    
    % 生成所有可能的边组合
    % 我们用二进制数来表示边的存在与否，每个二进制数表示一种图
    allCombinations = dec2bin(0:(2^numEdges - 1)) - '0';
    
    % 初始化邻接矩阵存储
    adjMatrices = {};
    
    % 对于每一种边组合，生成对应的邻接矩阵
    for i = 1:size(allCombinations, 1)
        adjMatrix = zeros(n, n);
        edgeIndex = 1;
        
        % 遍历邻接矩阵的上三角部分（排除对角线）
        for row = 1:n
            for col = row+1:n
                % 根据当前的二进制组合设置是否存在边
                if allCombinations(i, edgeIndex) == 1
                    adjMatrix(row, col) = 1;
                    adjMatrix(col, row) = 1; % 对称
                end
                edgeIndex = edgeIndex + 1;
            end
        end
        
        % 将生成的邻接矩阵存储起来
        if rank(adjMatrix)== n
            adjMatrices{i} = adjMatrix;
        end
    end
    adjMatrices(cellfun('isempty', adjMatrices)) = [];
    remove_isomorphic_graphs(adjMatrices);
end
