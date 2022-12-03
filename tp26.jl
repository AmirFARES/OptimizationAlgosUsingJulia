function createGraph(n,p)
    graph=zeros(Int8,n,n)
    for i=1:n
        for j=1:n
            tmp=rand(0:100)/100
            if tmp <= p
                graph[i,j]=1
            end
        end
    end
    return graph
end