#copy a file contect

source=open("demo.txt","r")
data=source.read()
source.close()
target=open("target.txt","w")
target.write(data)
target.close()
f=open("target.txt","r")
print(f.read())
f.close()