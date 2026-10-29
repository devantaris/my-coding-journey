a = int(input())
b = int(input())

for n in range(a, b + 1):
    c = 0 
    if n < 2:
        continue
    if n == 2:
        print(n)
        continue 
    if n % 2 == 0: 
        continue
    
    for i in range(2, int(n**0.5) + 1): 
        if (n % i) == 0:
            c = 1
            break 
    if c == 0:
        print(n)