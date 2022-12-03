# FARES Amir G03 IFIA
n=3
m=2
c=[91500 11000 38900]
a=[10 20 6;1 1 1]
b=[400 50]
table=zeros(m+1,n+m+1)
for i in 1:m
    for j in 1:n
        table[i,j]=a[i,j]
    end
end
for i in 1:m
    for j in n+1:n+1+m
        if i==j-n
            table[i,j]=1
        end
    end
end
for i in 1:m
    table[i,n+m+1]=b[i]
end
for i in 1:n
    table[m+1,i]=-c[i]
end
# base list   if 0 then its not in base  if 1 or 2 or ... its on base
base=zeros(1,n)

# find pivot column
global min = table[m+1,1]
    global cPivot=1
    for i=2:n+m
        if table[i]<min
            global min=table[i]
            global cPivot=i
        end
    end
while min<0
    global min = table[m+1,1]
    global cPivot=1
    for i=2:n+m
        if table[i]<min
            global min=table[i]
            global cPivot=i
        end
    end
    # find pivot line
    global min=table[1,n+m+1]/table[1,cPivot]
    global lPivot=1
    for i=2:m
        tmp=table[i,n+m+1]/table[i,cPivot]
        if tmp<min
            global lPivot=i
            global min=tmp
        end
    end
    # change who is in the base
    base[cPivot]=lPivot
    # filling the new table
    newTable=deepcopy(table)
    pivot = table[lPivot,cPivot]
    #filling pivot row = old pivot row / pivot
    for i=1:n+m+1
        newTable[lPivot,i]=table[lPivot,i]/pivot
    end
    #filling other rows = old row - (pivot column * new pivot row)
    for i=1:m+1
        if i!=lPivot
            for j=1:m+n+1
                newTable[i,j]=table[i,j]-(table[i,cPivot]*newTable[lPivot,j])
            end
        end
    end
    global table=deepcopy(newTable)
end
#taking variables values
for i=1:n
    tmp = trunc(Int,base[i])
    if tmp!=0
        base[i]=table[tmp,m+n+1]
        println("X",i,"=",base[i])
    else
        println("X",i,"=0")
    end
end
