using DataStructures
graph=Array([([2,3,4]),([1,3,5]),([1,2,4,5]),([1,3,6]),([2,3,6,7]),([4,5,8]),([5,8]),([6,7])])
# graph=Array([([2,3]),([]),([2,4]),([1,6]),([2,3,6]),([8]),([5,8]),([])])

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
    q=Queue{Int8}()
    enqueue!(q,v)
    coloredList[v]=1
    while (!isempty(q) && !myAll(coloredList,2))
        m=size(graph[first(q)])[1]
        if m!=0
            for j=1:m
                if coloredList[graph[first(q)][j]]==0
                    enqueue!(q,graph[first(q)][j])
                    coloredList[graph[first(q)][j]]=1
                end
            end
        end
        coloredList[first(q)]=2
        push!(parcoursList,dequeue!(q))
    end
    return parcoursList
end