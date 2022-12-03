#FARES Amir G03 IFIA
#for testing use this commands :
#ex1(graph1)
#ex2(graph2)
#ex3(mGraph3)
#ex4(lGraph4)
#ex5(mGraph5)
#ex6(8,0.3)
#ex7(graph7,1)
#ex89(graph8,1)
#ex89(graph9,1)



graph1 = [
#1 2 3 4 5 6 7 8
 0 1 1 1 0 0 0 0; 
 1 0 1 0 1 0 0 0;
 1 1 0 1 1 0 0 0;
 1 0 1 0 0 1 0 0;
 0 1 1 0 0 1 1 0;
 0 0 0 1 1 0 0 1;
 0 0 0 0 1 0 0 1;
 0 0 0 0 0 1 1 0]




function ex1(graph)
    n=size(graph)[1]
    for i=1:n
        for j=1:n
            if graph[i,j]!=graph[j,i]
                return false
            end
        end
    end
    return true
end

#-----------------------------------------------------------------------------------------------
graph2=Array([([2,3,4]),([1,3,5]),([1,2,4,5]),([1,3,6]),([2,3,6,7]),([4,5,8]),([5,8]),([6,7])])



function ex2(graph)
    n=size(graph)[1]
    for i=1:n
        for j in graph[i]
            if !(i in graph[j])
                return false
            end 
        end
    end
    return true
end

#-----------------------------------------------------------------------------------------------
mGraph3 = [
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

function ex3(mGraph)
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

#-----------------------------------------------------------------------------------------------

lGraph4=Array([([2,3,4]),([1,3,5]),([1,2,4,5]),([1,3,6]),([2,3,6,7]),([4,5,8]),([5,8]),([6,7])])

function ex4(lGraph)
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


#-----------------------------------------------------------------------------------------------
mGraph5 = [
#1 2 3 4 5 6 7 8
 0 1 1 1 0 0 0 0; 
 1 0 1 0 1 0 0 0;
 1 1 0 1 1 0 0 0;
 1 0 1 0 0 1 0 0;
 0 1 1 0 0 1 1 0;
 0 0 0 1 1 0 0 1;
 0 0 0 0 1 0 0 1;
 0 0 0 0 0 1 1 0]

function ex5(mGraph)
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

#-----------------------------------------------------------------------------------------------
function ex6(n,p)
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

#-----------------------------------------------------------------------------------------------
using DataStructures
graph7=Array([([2,3,4]),([1,3,5]),([1,2,4,5]),([1,3,6]),([2,3,6,7]),([4,5,8]),([5,8]),([6,7])])
# graph7=Array([([2,3]),([]),([2,4]),([1,6]),([2,3,6]),([8]),([5,8]),([])])

function myAll(list,x)
    nn=size(list)[1]
    for i=1:nn
        if (list[i]!=x)
            return false
        end
    end
    return true
end

function ex7(graph,v)
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


#-------------------------------------------------------------------------------------------------------
# graph8=Array([([2,3,4]),([1,3,5]),([1,2,4,5]),([1,3,6]),([2,3,6,7]),([4,5,8]),([5,8]),([6,7])])
graph9=Array([
    ([2,8,11])
    ,([1,3,5,7])
    ,([4,2])
    ,([5,7,3])
    ,([4,2,6])
    ,([5,7,8,9])
    ,([4,6,8,2])
    ,([7,6,9,11,2])
    ,([10,11,8,6])
    ,([11,9])
    ,([1,8,9,10])
    ])
graph8=Array([
    ([2,7,11])
    ,([3,4])
    ,([])
    ,([5,6]),([]),([]),([8,9,10]),([]),([]),([]),([12]),([13,14]),([]),([])
    ])

function ex89(graph,v)
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