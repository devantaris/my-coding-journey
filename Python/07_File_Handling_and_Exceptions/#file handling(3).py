#file handling

f=open("demo.txt", "r+")
f.write("abc")
data=f.read()
print(data)
f.close()