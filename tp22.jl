#filling graph 

graph=Array([([2,3,4]),([1,3,5]),([1,2,4,5]),([1,3,6]),([2,3,6,7]),([4,5,8]),([5,8]),([6,7])])



function no(graph)
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