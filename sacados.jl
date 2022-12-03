w=[30 10 20 50 40]      # Poids d'un ième objet
p=[66 20 30 60 40]      # Profit d'un ième objet
m=100                   # Capacité maximale du sac à dos

function greedyKnapsack(w,p,m)
    n=length(w)                 # nombre d'éléments disponibles
    x=zeros(Float16,1,n)        # C'est la fraction d'objet qui sera insérée dans le sac.
    maxProfit=0                 # Valeur maximale du profit
    i=1
    while i<n
        if w[i]<=m
            x[i]=1
            m=m-w[i]
            maxProfit=maxProfit+(p[i]*x[i])
        else
            break
        end
        i=i+1
    end
    
    if i<n 
        x[i]=m/w[i]
        maxProfit=maxProfit+(p[i]*x[i])
    end
    return maxProfit
end