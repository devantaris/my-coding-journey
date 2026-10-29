#fibbonaci series
a=0
b=1
c=0
n=int(input("enter number of values wanted in the series: "))

while c<=n:
    print(a)
    x=a+b
    a=b
    b=x  
    c=c+1