#factorial function

def fact():
    f=1
    n=int(input("enter the number: "))
    for i in range(1,n+1):
        f*=i
    return(f)

m=fact()
print(m)