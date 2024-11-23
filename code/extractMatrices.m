% 自定义递归函数来提取所有矩阵
function result = extractMatrices(cellArray)
    result = {};  % 初始化结果数组
    for i = 1:numel(cellArray)
        if iscell(cellArray{i})
            % 如果元素本身是一个 cell 数组，递归调用
            result = [result, extractMatrices(cellArray{i})];
        else
            % 否则，直接将矩阵加入结果
            result{end+1} = cellArray{i};
        end
    end
end

