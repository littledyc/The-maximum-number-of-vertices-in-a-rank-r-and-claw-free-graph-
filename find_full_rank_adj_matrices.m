function full_rank_adj_matrices = find_full_rank_adj_matrices(n)
    % 初始化一个空数组，用于存储满秩邻接矩阵
    full_rank_adj_matrices = {};
    
    % 生成所有可能的邻接矩阵的二进制编码
    % 矩阵的元素总数为 n*(n-1)/2（无向图且无自环）
    num_elements = n*(n-1)/2;
    
    % 遍历所有可能的邻接矩阵组合
    for i = 0:(2^num_elements - 1)
        % 将当前的编号转化为二进制向量
        binary_vector = dec2bin(i, num_elements) - '0';
        
        % 创建上三角邻接矩阵
        adj_matrix = zeros(n);
        upper_tri_index = triu(true(n), 1); % 获取上三角部分的索引
        adj_matrix(upper_tri_index) = binary_vector;
        
        % 对称填充下三角部分
        adj_matrix = adj_matrix + adj_matrix';
        
        % 检查该邻接矩阵是否满秩
        if rank(adj_matrix) == n
            % 满秩，保存该矩阵
            full_rank_adj_matrices{end+1} = adj_matrix;
        end
    end
end
