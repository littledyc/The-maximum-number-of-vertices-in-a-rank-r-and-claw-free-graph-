function D = generate_maxpoint(n,m)
    W=generateAllGraphs(n);
    D={};
    for i=1:length(W)
        B{i}=maxpoint(W{1,i});
    end
    C=notduplicatenodes(B);
    C=notduplicatenodes(B);
    for i=1:length(C)
    [x,y]=size(C{1,i});
        if x == m
            D{i}=[D,C{1,i}];
        end
    end
    D(cellfun('isempty', D)) = [];
end