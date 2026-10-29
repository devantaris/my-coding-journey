#nested

for i in range(1,6):
    for k in range(i,5):
        print(" ", end=' ')
    for j in range(1,i+1):
        print(j, end=' ')
    for l in range(i-1,0,-1):
        print(l,end=' ')
    print()

    
    