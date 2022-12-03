mGraph = [
#1 2 3 4 5 6 7 8
 0 1 1 1 0 0 0 0; 
 1 0 1 0 1 0 0 0;
 1 1 0 1 1 0 0 0;
 1 0 1 0 0 1 0 0;
 0 1 1 0 0 1 1 0;
 0 0 0 1 1 0 0 1;
 0 0 0 0 1 0 0 1;
 0 0 0 0 0 1 1 0]



function orientation(mGraph)
    nonOrientedGraph=deepcopy(mGraph)
    n=size(nonOrientedGraph)[1]
    for i=1:n-1
        for j=i+1:n
            if nonOrientedGraph[i,j]==1
                nonOrientedGraph[i,j]=rand((0,1))
                if nonOrientedGraph[i,j]==1
                    nonOrientedGraph[j,i]=0
                end
            end
        end
    end
    return nonOrientedGraph
end