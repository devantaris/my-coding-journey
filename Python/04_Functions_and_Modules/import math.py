
a=int(input("lower limit: "))
b=int(input("upper limit: "))
for n in range(a,b+1):
    prime=True
    for i in range (2, n):
        if (n%i)==0:
            prime=False
            break
    if prime:
      print(n)