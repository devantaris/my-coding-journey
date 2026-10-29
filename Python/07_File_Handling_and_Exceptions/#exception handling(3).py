#exception handling without raising exception

try:
    num=10
    print(num)
    raise ValueError
except:
    print("exception occured.. program terminating")
print("BYE")