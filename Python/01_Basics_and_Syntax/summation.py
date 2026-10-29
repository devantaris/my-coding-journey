#summation 1/1 + 4/2 + 27/3 + 256/4 ......

s=0
n=int(input("Enter value of n: "))
for i in range(1,n+1):
    s=s+((i**i)/i)
    i+=1

print(s)