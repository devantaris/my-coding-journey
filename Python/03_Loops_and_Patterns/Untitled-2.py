#using a for loop with range print all the prime numbers from 1 to 30
def findprime(n):
    flag = 0
    i = 2

    if n > 1:
       for i  in range (2,n // 2):
          if (n % i) == 0:
            flag = 1
            break
          i += 1

    if flag == 0:
        print(n)

for n in range(1,30):
    findprime(n)