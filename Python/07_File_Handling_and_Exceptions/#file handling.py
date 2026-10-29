#file handling
f=open("#filehandling.txt", "r")
data=f.read()
print(data)
print(type(data))

line1=f.readline()  #for reading lines one by one top to bottom
print(line1)

f.close()