function result = contains_symmetric_submatrices(A, submatrices)
    % 获取主矩阵的行数和列数
    [rowsA, colsA] = size(A);
    
    % 如果主矩阵的行或列少于 4，则无法找到匹配
    if rowsA < 4 || colsA < 4
        result = false;
        return;
    end
    
    % 提取主矩阵的所有四阶主子阵
    submatrix_to_check = getAllKOrderPrincipalSubmatrices(A, 4);
    % 遍历每一个要查找的子矩阵，检查是否匹配
    for i = 1:length(submatrix_to_check)
        for k = 1:length(submatrices)
            if isequal(submatrix_to_check{i}, submatrices{k})
                result = true;
                return;
            end
        end                
    end
    
    % 如果遍历完所有情况，仍然没有匹配
    result = false;
end
