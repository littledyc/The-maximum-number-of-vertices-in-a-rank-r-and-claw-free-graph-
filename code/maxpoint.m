function Q = maxpoint(adjMatrixList)
    Q{1} = adjMatrixList;
    a=rank(Q{1});
    for i=1:200
        Q{i+1}=cycle(Q{i},a);
        if isempty(Q{i+1})
            Q(end)=[];
            break
        end
    end
end