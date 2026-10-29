# average class

class student:
    def __init__(self,name,marks):
        self.name=name
        self.marks=marks
    
    def avg(self):
        sum=0
        for val in self.marks:
            sum+=val
        print("average marks of ", self.name," is: ", sum/3)

s1=student("devansh",[95,95,95])
s1.avg()

s2=student("priyansh",[93,93,93])
s2.avg()
