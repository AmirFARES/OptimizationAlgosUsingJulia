using DataStructures
# graph=Array([([2,3,4]),([1,3,5]),([1,2,4,5]),([1,3,6]),([2,3,6,7]),([4,5,8]),([5,8]),([6,7])])
# graph=Array([
#     ([2,8,11])
#     ,([1,3,5,7])
#     ,([4,2])
#     ,([5,7,3])
#     ,([4,2,6])
#     ,([5,7,8,9])
#     ,([4,6,8,2])
#     ,([7,6,9,11,2])
#     ,([10,11,8,6])
#     ,([11,9])
#     ,([1,8,9,10])
#     ])
graph=Array([
    ([2,7,11])
    ,([3,4])
    ,([])
    ,([5,6]),([]),([]),([8,9,10]),([]),([]),([]),([12]),([13,14]),([]),([])
    ])

function myAll(list,x)
    nn=size(list)[1]
    for i=1:nn
        if (list[i]!=x)
            return false
        end
    end
    return true
end

function parcours(graph,v)
    n=size(graph)[1]
    coloredList=zeros(Int8,n) #0 nonColored     #1 gray     #2 black
    parcoursList=[]
    q=Stack{Int8}()
    push!(q,v)
    coloredList[v]=1
    while (!isempty(q) && !myAll(coloredList,2))
        m=size(graph[first(q)])[1]
        j=1
        while j<=m && coloredList[graph[first(q)][j]]!=0
            j=j+1
        end
        if j==m+1 
            coloredList[first(q)]=2
            push!(parcoursList,pop!(q))
        else
            if coloredList[graph[first(q)][j]]==0
                coloredList[graph[first(q)][j]]=1
                push!(q,graph[first(q)][j])
            end
        end
    end
    return parcoursList
end