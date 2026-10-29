'''#armstrong
n=int(input("Enter a three digit number: "))
s=0
num=n
while(num>0):
    r=num%10
    s+=(r**3)
    num=num//10
if (n==s):
    print("Number is armstrong")
else:
    print("Number is not armstrong")'''

def newton_sqrt(n, tolerance=1e-10):
    guess = n / 2
    while abs(guess * guess - n) > tolerance:
        guess = (guess + n / guess) / 2.0
    return guess
print(newton_sqrt(int(input()))) 