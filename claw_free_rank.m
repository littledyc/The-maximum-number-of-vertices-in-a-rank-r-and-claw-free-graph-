function full_rank_matrices = claw_free_rank(A,k)
    % 输入: A是一个矩阵，k是矩阵的秩
    % 输出: full_rank_matrices 是维数加一之后claw-free且秩不变的矩阵构成的cell数组

    full_rank_matrices = {};  % 初始化一个空的cell数组
    submatrices = {
    [0 1 1 1; 1 0 0 0; 1 0 0 0; 1 0 0 0],
    [0 1 0 0; 1 0 1 1; 0 1 0 0; 0 1 0 0],
    [0 0 1 0; 0 0 1 0; 1 1 0 1; 0 0 1 0],
    [0 0 0 1; 0 0 0 1; 0 0 0 1; 1 1 1 0]}; %需要检测的子矩阵K1-3
    
    [m, n] = size(A);%获取输入矩阵的维数
    
    % 检查输入是否为方阵
    if m ~= n
        error('输入矩阵必须是方阵');
    end
    
    % 计算所有可能的0/1组合并去除全为0的组合
    combinations = dec2bin(0:(2^m-1)) - '0'; % 生成所有组合 (2^m 种)
    combinations = combinations(any(combinations, 2), :);
    % 初始化结果单元格数组来保存满秩的矩阵
    full_rank_matrices = {};

    
    % 遍历所有组合
    for i = 1:size(combinations, 1)
        % 生成新矩阵
        new_matrix = zeros(m+1, m+1);
        new_matrix(1:m, 1:m) = A; % 保留原矩阵
        
        % 获取当前组合的0/1值
        new_column = combinations(i, :)'; % 当前组合的列向量
        
        % 设置新行和新列
        new_matrix(1:m, end) = new_column;  % 设置最后一列
        new_matrix(end, 1:m) = new_column'; % 设置最后一行
        new_matrix(end, end) = 0;          % 设置对角线为0
        result = contains_symmetric_submatrices(new_matrix, submatrices);%检查矩阵是否claw-free

        % 检查矩阵是否秩不变且claw-free
        if rank(new_matrix) == k && result == 0 
            % 如果矩阵是秩不变且claw-free的，保存它
            full_rank_matrices{end+1} = new_matrix;
        end
    end
end
