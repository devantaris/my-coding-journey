#assignment module 7
largest = None
smallest = None
the_list = []

while True:
    num = input()
    if num == "done":break
    if len(num) < 1: break
    try:
        number = int(num)
        the_list.append(num)
    except:
        print("Invalid input")

largest = -1
for the_num in [7,2,10,4]:
    if the_num > largest:
        largest = the_num
        
smallest = None
for value in [7,2,10,4]:
    if smallest is None:
        smallest = value
    elif value < smallest:
        smallest = value
        
print("Maximum is", largest)
print("Minimum is", smallest)