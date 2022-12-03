#filling graph 

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


lGraph=[]

function mTOl(mGraph)
    n=size(mGraph)[1]
    for i=1:n
        push!(lGraph,[])
        for j=1:n
            if mGraph[i,j]!=0
                push!(lGraph[i],j)
            end
        end
    end
    return lGraph
end