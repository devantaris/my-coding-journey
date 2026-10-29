#nested
for i in range(1,4):
    print("\n")
    for j in range(1,4-i):
        print(" \t", end=' ')
    for k in range(4-i,4):
        print(i,"\t", end=' ')
    
    