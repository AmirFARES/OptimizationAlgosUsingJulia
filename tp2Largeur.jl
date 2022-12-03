using DataStructures

# par largeur with queue fifo

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
q=Queue{String}()
# sommet initiale :
enqueue!(q,"A")

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
    for i=1:n
        if cGraph[ourLetter,i]==1 && list[i,2]==0 #not colored
            enqueue!(q,list[i,1])
            list[i,2]=1 #gray
        end
    end
    println(dequeue!(q))
    list[ourLetter,2]=2 #black
end