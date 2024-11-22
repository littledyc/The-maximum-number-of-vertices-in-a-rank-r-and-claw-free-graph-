function isConnected = checkGraphConnectivity(adjMatrix)
    % 检测邻接矩阵代表的图是否联通
    % 输入:
    %   adjMatrix - 邻接矩阵
    % 输出:
    %   isConnected - 如果图是连通的，返回 true；否则返回 false。

    % 获取节点数
    numNodes = size(adjMatrix, 1);
    
    % 创建一个访问标记数组
    visited = false(1, numNodes);
    
    % 使用深度优先搜索（DFS）从第一个节点开始
    dfs(adjMatrix, 1, visited);
    
    % 检查访问标记数组，如果所有节点都被访问过，则图是连通的
    isConnected = all(visited);
end

function dfs(adjMatrix, node, visited)
    % 深度优先搜索（DFS）函数
    % 输入:
    %   adjMatrix - 邻接矩阵
    %   node - 当前访问的节点
    %   visited - 访问标记数组

    % 标记当前节点为已访问
    visited(node) = true;
    
    % 遍历当前节点的所有邻接节点
    for neighbor = 1:size(adjMatrix, 1)
        if adjMatrix(node, neighbor) == 1 && ~visited(neighbor)
            % 如果邻接且未访问，递归访问
            dfs(adjMatrix, neighbor, visited);
        end
    end
end
