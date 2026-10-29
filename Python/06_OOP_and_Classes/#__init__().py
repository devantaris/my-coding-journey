#__init__()

class student :

    def __init__(self,fullname,marks):
        self.name=fullname
        self.marks=marks
        print("Adding new database...")

s1=student("Devansh",95)
print(s1.name)
print(s1.marks)

s2=student("Priyansh",93)
print(s2.name)
print(s2.marks)