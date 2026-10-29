#hcf
a=int(input("Enter the 1st number: "))
b=int(input("Enter the 2nd number: "))

while(a!=0):
    r=b%a
    b=a
    a=r
print(b)