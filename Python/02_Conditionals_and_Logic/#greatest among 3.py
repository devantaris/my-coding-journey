#greatest among 3
a=int(input("enter 1st integer: "))
b=int(input("enter 2nd integer: "))
c=int(input("enter 3rd integer: "))
if(a>b):
    if(a>c):
        print(a, " is the largest")
    else:
        print(c, " is the largest")
else:
    if(b>c):
        print(b, " is the largest")
    else:
        print(c, " is the largest")