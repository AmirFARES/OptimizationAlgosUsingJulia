using DataStructures

# par profondeur with stack filo

n=6 #n : nbr de sommets
#filling graph 
graph = [
#A B C D E F
 0 1 1 0 0 0; 
 0 0 1 1 0 0;
 0 0 0 0 1 0;
 0 0 0 0 0 1;
 0 0 0 1 0 0;
 0 0 0 0 0 0]
cGraph = deepcopy(graph)
# 0 not colored ; 1 gray ; 2 black
list = ["A" 0;"B" 0;"C" 0;"D" 0;"E" 0;"F" 0]
q=Stack{String}()
# sommet initiale :
push!(q,"A")


while !isempty(q)
    println();println();println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    println(list)
    println(q)
    global ourLetter=1
    for i=1:n
        if first(q)==list[i]
            global ourLetter=i
        end
    end
    list[ourLetter,2]=1 #gray
    i=1
    while (i<7 && cGraph[ourLetter,i]==0) || (i<7 && cGraph[ourLetter,i]==1 && list[i,2]!=0)
        i=i+1
    end
    if i!=7
        if list[i,2]==0 #not colored
            push!(q,list[i,1])
            list[i,2]=1 #gray
        end
    else
        println("//////    ",pop!(q))
        list[ourLetter,2]=2 #black
    end
end