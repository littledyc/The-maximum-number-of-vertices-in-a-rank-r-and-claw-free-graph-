function submatrices = getAllKOrderPrincipalSubmatrices(A, K)
    % 输入:
    % A: n x n 矩阵
    % K: 主子矩阵的阶数
    % 输出:
    % submatrices: 一个包含所有 K 阶主子矩阵的单元数组

    [n, m] = size(A);
    if n ~= m
        error('矩阵必须是方阵');
    end
    if K > n || K <= 0
        error('K 必须在 1 到 n 之间');
    end

    % 生成所有从 n 个元素中选择 K 个元素的组合
    combinations = nchoosek(1:n, K);

    % 初始化存储所有 K 阶主子矩阵的单元数组
    submatrices = {};

    % 遍历所有行和列组合（行和列的索引必须相同）
    for i = 1:size(combinations, 1)
        % 提取 K x K 的主子矩阵
        indices = combinations(i, :);
        submatrix = A(indices, indices);
        % 将主子矩阵存储到单元数组中
        submatrices{end + 1} = submatrix; 
    end
end
