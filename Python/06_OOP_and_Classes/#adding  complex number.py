# adding complex number

class complex:
    def __init__(self,real,img):
        self.real=real
        self.img=img

    def shownumber(self):
        print(self.real, "+ ",self.img,"i")

    def __add__(self,num2):                       #dunder function
        newreal=self.real+num2.real
        newimg=self.img+num2.img
        return complex(newreal,newimg)
    
num1=complex(1,3)
num2=complex(3,6)

num1.shownumber()
num2.shownumber()

num3=num1+num2
num3.shownumber()