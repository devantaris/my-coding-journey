#no overriding problem
#python executes in a sequence

class person:
    def __init__(self,name,age,gender):
        self.name=name
        self.age=age
        self.gender=gender
    def display(self):
        print("NAME: ",self.name)
        print("AGE: ",self.age)
        print("GENDER: ", self.gender)
class publication:
    def __init__(self,no_rp,no_books,no_arts):
        self.no_rp=no_rp
        self.no_books=no_books
        self.no_arts=no_arts
    def display(self):
        print("No. of research publications: ", self.no_rp)
        print("No. of books published: ", self.no_books)
        print("No. of articles published: ", self.no_arts)

class faculty(person):
    def __init__(self,name,age,gender,design,dept,no_rp,no_books,no_arts):
        person.__init__(self,name,age,gender)
        self.design=design
        self.dept=dept
        self.pub=publication(no_rp,no_books,no_arts)
    def display(self):
        person.display(self)
        print("DESIGNATION: ",self.design)
        print("DEPARTMENT: ",self.dept)
        self.pub.display()

F=faculty("Devansh",38,"MALE","ENGINEER","IT CELL",3,12,5)
F.display()