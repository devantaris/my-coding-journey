#sorting without using listxyz.sort()
a=[]
n=int(input("Enter the number of elements: "))
for i in range (n):
    element=int(input("Enter the element: "))
    a.append(element)
for i in range (n):
    for j in range (i+1,n):
        if a[i] > a[j]:
           a[i], a[j] = a[j], a[i]
for i in range(n):
    print (a[i])


print(a.sort())