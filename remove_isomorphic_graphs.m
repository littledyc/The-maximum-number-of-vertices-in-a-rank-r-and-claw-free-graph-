function uniqueGraphs =  remove_isomorphic_graphs(adjMatrixList)
    % 输入: adjMatrixList 是一个包含多个邻接矩阵的 cell 数组
    % 输出: uniqueGraphs 是删除了同构图后的邻接矩阵列表

    % 获取图的数量
    numGraphs = length(adjMatrixList);

    % 初始化一个逻辑数组来标记要保留的图
    keepGraph = true(1, numGraphs);
    
    % 遍历每对图，检查它们是否同构
    for i = 1:numGraphs-1
        if ~keepGraph(i)
            continue;  % 如果第i个图已经被标记为不保留，跳过它
        end
        for j = i+1:numGraphs
            if keepGraph(j)
                % 创建图对象
                G1 = graph(adjMatrixList{i});  % 使用graph类创建无向图对象
                G2 = graph(adjMatrixList{j});
                
                % 检查两图是否同构
                if isisomorphic(G1, G2)
                    keepGraph(j) = false;  % 如果同构，标记j为false，表示删除
                end
            end
        end
    end

    % 根据标记的数组筛选出保留的图
    uniqueGraphs = adjMatrixList(keepGraph);
end
