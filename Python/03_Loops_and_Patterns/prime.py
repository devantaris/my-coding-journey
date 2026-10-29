#prime
n = int(input("Enter number to check: "))
flag = 0
i = 2

if n > 1:
    while i <= n // 2:
        if (n % i) == 0:
            flag = 1
            break
        i += 1

if flag == 0:
    print(n, "is a prime number.")
else:
    print(n, "is not a prime number.")
