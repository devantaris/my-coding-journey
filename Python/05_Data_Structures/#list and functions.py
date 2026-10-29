#length of list
#print list in same line

cities=["varanasi","delhi","noida","pune","mumbai"]
heroes=["shaktiman","ironman","thor"]
def length(list):
    print(len(list))

def print_list(list):
    for i in list:
        print(i,end=' ')

length(cities)
length(heroes)

print_list(heroes)
print("\n")
print_list(cities)