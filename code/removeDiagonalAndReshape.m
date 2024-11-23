function B = removeDiagonalAndReshape(A)
    n = size(A, 1);  % 获取矩阵维数
    B = zeros(n, n-1);  % 初始化新的矩阵大小 (n x (n-1))
    
    for i = 1:n
        % 删除对角线元素并提取剩余列
        row = A(i, :);  % 获取第 i 行
        row(i) = [];    % 删除对角线元素 (第 i 列)
        B(i, :) = row;  % 将剩下的元素放入新的矩阵
    end
end
