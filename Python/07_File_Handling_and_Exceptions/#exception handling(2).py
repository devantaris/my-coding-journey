#exception handling all in one block

try: 
    num=int(input("enter the number: "))
    print(num**2)
except (KeyboardInterrupt,ValueError,TypeError):
    print("you should have entered a number.... program terminating..")
print("BYE")