function  result_matrices = cycle(adjMatrixList,a)
    % 输入: adjMatrixList是一个矩阵,a是矩阵的秩
    % 输出: result_matrices是一个包含所有迭代过程的cell数组

        %初始化变量
        numGraphs = length(adjMatrixList);
        result_matrices = {}; A={};
        %检查输入是否为cell数组，是的话正常迭代，不是的话就当作矩阵来迭代
        if iscell(adjMatrixList)
            for j=1:numGraphs
                A{j} = claw_free_rank(adjMatrixList{j},a);
                A{j} = remove_isomorphic_graphs(A{j});
                result_matrices = [result_matrices,A{j}];
                result_matrices =remove_isomorphic_graphs(result_matrices);
            end
        else
            B = claw_free_rank(adjMatrixList,a);
            result_matrices = remove_isomorphic_graphs(B);
        end
end

