#filling graph 

graph = [
#1 2 3 4 5 6 7 8
 0 1 1 1 0 0 0 0; 
 1 0 1 0 1 0 0 0;
 1 1 0 1 1 0 0 0;
 1 0 1 0 0 1 0 0;
 0 1 1 0 0 1 1 0;
 0 0 0 1 1 0 0 1;
 0 0 0 0 1 0 0 1;
 0 0 0 0 0 1 1 0]




function no(graph)
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