#finding number of commas in a file

f=open("#filehandling.txt","r")
data=f.read()
print(data)
n=0

for i in range(len(data)):
    if(data[i]==","):
        n+=1
    
print("file has" ,n, " commas")