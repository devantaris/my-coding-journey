# @property

class student:
    def __init__(self,phy,math,chem):
        self.phy=phy
        self.chem=chem
        self.math=math

    @property
    def calculate(self):
        return str((self.phy+self.chem+self.math)/3)+ "%"
    
s1=student(98,97,99)
print(s1.calculate)

s1.phy=86
print(s1.calculate)