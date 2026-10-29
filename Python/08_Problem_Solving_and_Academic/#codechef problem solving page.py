#codechef problem solving page
"""check and print how many
 times the number 4 has occured in elements and print at the end"""

"""a = []
n = int(input("Enter the number of elements:"))
for i in range(n):
    num = int(input("enter the number: "))
    a.append(num)


c = 0
for num in a:
    while num > 0:
        digit = num % 10
        if digit == 4:
            c += 1
        num //= 10
    print(c)"""

T=int(input())
for T in range(T):
    n=int(input())
    st=input()
    c=0
    flag=0
    v=['a','e','i','o','u']
    for i in st:
        if i not in v:
            c+=1
        else:
            c=0
        if c>=4:
            flag=1
    if flag==1:
        print("NO")
    else:
        print("YES")