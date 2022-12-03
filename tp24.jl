#filling graph 

lGraph=Array([([2,3,4]),([1,3,5]),([1,2,4,5]),([1,3,6]),([2,3,6,7]),([4,5,8]),([5,8]),([6,7])])



function lTOm(lGraph)
    n=size(lGraph)[1]
    mGraph=zeros(Int8,n,n)
    for i=1:n
        m=size(lGraph[i])[1]
        if m!=0
            for j=1:m
                tmp=lGraph[i][j]
                mGraph(i,tmp)=1
            end
        end
    end
    return mGraph
end