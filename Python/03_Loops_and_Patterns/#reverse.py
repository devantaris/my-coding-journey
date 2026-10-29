#reverse
s=0
n=int(input("Enter a 3 digit number: "))

while (n!=0):
    r=n%10
    s=s*10 + r
    n=n//10
print(s)