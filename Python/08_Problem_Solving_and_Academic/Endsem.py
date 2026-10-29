'''
Copyright 2024-2024^2
Author : Rishabh Verma
This course is under TTL 1.0 : (Tuichki Tuiyan License) 
Basically re-distributiion is prohibhited

This course covers *almost* all important topics necessary for End-sem Python
*understand* it diligently to score good marks...
'''
#Lessss beginnn !

#Lets work with lists first
l1 = [1,2,3,4,5,6,5,7,8]
print("Some slicing")
print(l1[0:3])
print(l1[-1:3:-1])

l1.append(["Aaloo", "khalo"]) #Inserts this whole list as an element
l1.extend([9,10,11,12]) # "Extends" the original list by adding elements of this this list
print(l1)

#pop and remove
#pop() will remove the last element in the list, it takes 1 positional argument which is...the index at which you want to delete the element
print("Demo with pop()" , l1.pop()) #It also returns the element that it has popped !
print("Demo with pop(2)" , l1.pop(2)) #So it will pop out '3' at index : 2

#remove() will *remove* FIRST OCCURENCE of the given element
l1.remove(5)
print("Demo with remove(5)" , l1) #RIP 5 I
#Itteration 
for a in l1:
    print(a ," -> ", end="")

#range based
for i in range(len(l1)):
    print(l1[i] , "- > " , end = "")

#While loop stuff : Finding no. of all vowels
testS = "Ae murkh, apni chavi sudhar !"
itt = 0
freqmap = {"a" : 0 , "e" : 0 , "i" : 0 , "o" : 0}
while (itt < len(testS)):
    if testS.lower()[itt] in freqmap.keys(): #Just cast it to lower so we just get the absolute value of vowles and not based of differential case (:
        freqmap[testS.lower()[itt]] += 1
    itt += 1
print(freqmap)

#printing the checker board using for loop
dot = False #Flag for flipping what to draw
for i in range(5):
    for j in range(5):
        if (not dot):
            print("# ", end="")
        else:
            print("* " , end ="")
        dot = not dot 
    print()

#Triangle
for i in range(8):
    for j in range(i):
        print("* " , end = " ")
    print()

#Hollow sqaure (yeah)
size = 7
for i in range(size):
    for j in range(size):
        if (i == 0 or i == size-1):
            print("* ", end=" ")
        else :
            if (j == 0 or j == size-1):
                print("* ", end=" ")
            else:
                print("  " ,  end = " ")
    print()

#Finding if a number is prime or not...
num = 71
for i in range(2,num):
    if (num % i == 0):
        print("Not a prime !")
        break
   
#find the sum of digits
num1 = 6089
def sumDig(n):
    it = n
    sumf = 0
    while it > 0:
        sumf += int(it % 10)
        it /= 10
    return sumf
print(sumDig(num1))

#reverse a string
string1 = "Hello betaaaan"
def revStr(st):
    return st[::-1]

print(revStr(string1))

#Palindrome checker
string2 = "aawwoo$$0000$$oowwaa"#| True
#string2 = "Pakoda"              | False
def check_palindrome(st):
    n = len(st)-1
    for i in range(n):
        if (st[i] != st[n - i]):
            return False
    return True

print(check_palindrome(string2))

#Falttern a matrix
matA = [
    [1,2,5],
    [5,2,3],
    [3,1,2]
]

def faltternMat(m):
    lst = []
    for i in matA:
        lst.extend(i)
    return lst

print(faltternMat(matA))

#Too easy by lets do an example of default arguements in a function as well
def say(string , index = 0):
    return string[index]

print(say("Hello")) #Just says 'H' as the default index is set to 0 if we dont specify any 
print(say("Hello" , 3)) #Now as we spcified : 3 , it 

#List comprehension
#Square of numbers
l2 = [n**2 for n in range(4)] #Squared numbers
print(l2)
l3 = [n for n in range(15) if n % 2 != 0] #Odd numbers
print(l3)
sl1 = ["beta" , "aisa" ,"hai"]
l4 = [st.upper() for st in sl1] #turn to upper case
print(' '.join(l4))

#Difference between sort() and sorted()
nsrt = [3,1,4,5,7,1,3,8]
print("Original" , nsrt)
nsrt.sort()
print("Sorted using sort()" , nsrt)
nsrt2 = [4,7,9,0,1,3,2]
print("Another list to sort :", nsrt2)
newsrt = sorted(nsrt2) #This basically creates a new new copy of the sorted list !
print("New sorted copy using sorted()" , newsrt)
#Now dictionary time !
dic1 = {"Juice" : 1 , "Pilado" : 2 , "Mausambi" : 3 , "Ka" : 4}
print(dic1)
print(" ".join(dic1.keys()))
#Through itteration
sen = []
for w in dic1:
    sen.append(w)
print(" ".join(sen))

# "THE" Lambda function²
multiply = lambda x , y : x*y
print(multiply(5,3))

#Filterng
nums = [1,3,5,2,7,8]
final = filter(lambda x : x % 2 == 0 , nums) #Even nums

print(list(final))
'''Hol'up ! Gotta do the map function as well !
demo :'''
nums1 = [1.22,3.14,2.56,7.45,6.69]
fin = list(map(int,nums1)) #First arguemnet takes a function that is supposed to be called for EACH item in the itterable given in the second arguement !
print(fin)                 #In this case we are doing a static_cast into 'int'

#cube of numbers (Lambda and map combined !)
nums2 = [1,2,3,4,5,6,10]
fin1 = list(map(lambda x : x**3 , nums2))
print(fin1)

#Now this is mentioned in the syllabus so yeah :
#There is this function called reduce() from a library named "Functools"
# reduce(<your function> , <an itterable container> , <initializer>) this initliaszer allows us to give a custom index to start with !

from functools import reduce
nums3 =  [1,2,5,7,9]
res1 = reduce(lambda acc , x : x**2 ,nums3 , 2) #Here it's taking each element, getting it squared the accumulating it, like sigma/summision
print(res1)                                     #And that summision is stored in the accumulator 'acc'

#Nowww the epicc partttt !
# ***DRUM ROLLLLL****       RECURSION

def factorial(n):
    if n == 1:
        return 1
    else:
        return n * factorial(n-1)
    
print(factorial(5))

def fibb(num , backtrack = {}): #Fibonacci
    if num <= 1:
        return num
    
    if (num not in backtrack):
        backtrack[num] = fibb(num - 1 , backtrack) + fibb(num - 2, backtrack)
    
    return backtrack[num]

print(fibb(11))

def GCD(num1 ,num2): #IMP ! : Greatest Common Divisor using Euclid's algorithm 
    if (num2 == 0):
        return num1
    else:
        return GCD(num2 , num1 % num2)

print("The GCD is ",GCD(5017298132874238961237698273472,27392649823217681293686837183876)) 

''' Alternative, just in case you suck at recursion (JK)
b = 5017298132874238961237698273472
a = 27392649823217681293686837183876
while b !=0:
    a,b = b,a%b
print(a)
'''
#Sets now : no duplicate elements
set1 = {1,2,3,4,5}
set2 = {2,3,4}
print(set1.issuperset(set2)) #Checks if the set in the arguement is the superset of the set on which the method is called...
print(set2.issubset(set1)) #Now checks if it is the subset 
print(set1.difference(set2)) #Non common elements
print(set1.intersection(set2)) #Common elements
print(set1.union(set2)) # *sigh...* Union

#Enumrate
for id , val in enumerate(dic1, 3): #Can be written as start = 3 as well | For defining the starting index
    print(f"The value for {id} is {val}")

#Tuples
a = (1,2,3)
print("This is the tuple 'a' " , a)
x,y,z = a
print("And this is after unpacking it into x,y and z",x , y ,z)

#Now string operations...(I have demonstrated some above...but lets segregate this...)
str1 = "Cheen tapak dam damm"
print(str1.upper()) #All capital
print(str1.swapcase()) #Swaps the current case...like C -> c and h -> "H"
print(str1.lower()) #yeah turns it into lowercase
print(str1.find("een")) #Finds the index of the given substring

# EXPRESSION MATCHING (Another important one)
import re
str2 = "Aapki tarah mai bhi mayus hu, dill dhukha toh hai but toota toh nahi hai, umeed pe duniya fir bhi kayam hai 100% 122-332-127"

#Patterns
'''
.	Matches any character except a newline.
^	Matches the start of the string.
$	Matches the end of the string.
*	Matches 0 or more occurrences of the preceding character.
+	Matches 1 or more occurrences of the preceding character.
?	Matches 0 or 1 occurrence of the preceding character.
'''
pat1 = r"A...i" #Starts with 'A' , has 3 random characters , then 'i'
pat2 = r"\d\d\d" # 3 digit
#create more patterns and try....
# 1) search() : it scans the whole string to find the *first match* (first occurence)
s1 = re.search(pat2 , str2)
print(s1)
# 2) findall() : it rather finds all matches in the given string
s2 = re.findall(pat2,str2)
print(s2)
# 3) match() : it starts to check, wheather the start of string matches the pattern
str3 = "222-345"
s3 = re.match(pat2,str3)
print(s3)

#Now time for OOPs
class Car:
    Company = ""
    Name = ""
    Transmission = ""
    FuelType = ""

    def __init__(self, company, name, transmission, Ftype):
        self.Company = company
        self.Name = name
        self.Transmission = transmission
        self.FuelType = Ftype

    def show_info(self):
        print("Company :", self.Company)
        print("Car name :", self.Name)
        print("Transmission :", self.Transmission)
        print("Fuel Type :", self.FuelType)

MustangGT = Car("Ford","Mustang-GT","Manual","Petrol")
MustangGT.show_info()
#inheritance
class Truck(Car):
    Load_capacity = 0
    Chassis = ""
    def __init__(self, company, name, transmission, Ftype , load_capacity , chassis):
        super().__init__(company, name, transmission, Ftype)
        self.Load_capacity = load_capacity
        self.Chassis = chassis

    def show_info(self):
        print("Company :", self.Company)
        print("Truck name :", self.Name)
        print("Transmission :", self.Transmission)
        print("Fuel Type :", self.FuelType)
        print("Load-capacity(TON) : " , self.Load_capacity)
        print("Chassis type : " , self.Chassis)
    
Peter = Truck("Volvo" , "V50G" , "Manual" , "Disel" , 1050 , "Semi-forward")
Peter.show_info()

#Exception handelling
# you put the thing you wnat to "try" in the try block, then you put how you want to handle an anticipated exception in the "except" bloc
#In "Finally" block you write what is supposed to happen if all except cases are not valid
x = 10
y = 5 #Change this to exprience different errors
#You need to inherit exception, when you define your new exception as an object
class MeriMarziError(Exception):
    pass

try:
    if y > 10:
        raise MeriMarziError
    result = x/y
except ZeroDivisionError:
    print("Dude, how come you divide by 0 ?!")
except MeriMarziError:
    print("You cant divide with a value larger than 10 !")
finally:
    print(result)

#File handling
file = open("song.txt" , "a")
file.write("\n Tuichki Tuiyaan \n")
file.close()

file = open("song.txt" , "r")
print(file.read())
file.close()

#Bitwise operators !
# CAUTION : Revise bit conversion with this as well , also know your *truth tables* !!
print("Bitwise stuff")
a = 5  # Binary: 101
b = 3  # Binary: 011
bitand = a & b  # Binary: 001
print("5 & 3 - > " , bitand)  #  AND 1
print("5 | 3 -> " , a | b) # OR 7
print("5 ^ 3 -> " , 5^3) # XOR 6
#Left and right shift
print(5 << 2) #20 (Do 5 x 2 = 10 , then again -> 10 x 2 = 20 | if it was 5 << 3 , ans would have been 40, get it ?)
print(5 >> 2) #1 (Same thing as above, but now you divide rather than multiplication)

#Check if a number is a power of 2 :
def check_pow2(n):
    if n <= 0:
        return False
    return (n & (n-1)) == 0
print(check_pow2(16)) #True

#Another ques : swap two variables without an intermediate variable
#a = int(input())
#b = int(input())
a1 = 24
b1 = 13
print("a1 is : ",a1 , " and ", "b1 is : ",b1)
a1 = a1 + b1
b1 = a1 - b1
a1 = a1 - b1
print("a1 is now : ",a1 , " and ", "b1 is now : ",b1)

'''Un-comment this section to use it
#Tkinter
import tkinter as tk #This is custom namespacing

main = tk.Tk()
#All customisations here
#Labels
#Geometry managers
# 1) using place
label = tk.Label(main, text="Yoooooo")
label.place(x=300, y=300)
# 2) using grid 
label2 = tk.Label(main , text = "Another one",bg="lightblue") #you can give your own gackground color as well
label2.grid(row = 0 , column = 0 , sticky="n") #Sticky : how you want the lable to be aligned... n : north ; s : south and so
# 3) using pack
#label3 = tk.Label(main,text = "Bruuuuh")
#label3.pack()

#Buttons
def say_hello(): #A function that you want your button to perform
    print("Helloooooooooooooooooooooooooooo !")
but1 = tk.Button(main , text="Hello !", command=say_hello,relief="solid") #relief tells how you want the button to be styled
but1.place(x=100,y=100)

#Input using Entry
ent1 = tk.Entry(main)
ent1.place(x=200,y=200)
#To get what is passed in entry -> ent1.get()
#Menus !
menu = tk.Menu(main)

# Create a submenu
file_menu = tk.Menu(menu, tearoff=0)
file_menu.add_command(label="Open")
file_menu.add_command(label="Save")
file_menu.add_separator()
file_menu.add_command(label="Exit", command=main.quit)

# Add the submenu to the menu bar
menu.add_cascade(label="File", menu=file_menu)

main.config(menu=menu)
main.title("Test")
main.geometry("600x600")
main.mainloop()
'''

''' Uncomment to use !
#Turtle
import turtle as tu

#Screen
screen = tu.Screen()
screen.title("Flight path test")
screen.bgcolor("white")

tur = tu.Turtle() #The turtle that will act as our pen
tur.shape("turtle")
tur.penup()
#tur.goto(-400,200)
tur.setpos(-400,200)
tur.pendown()
tur.pencolor("green") # or (0,0,255) in RGB | For the layman : you give the ammount of (Red , Blue ,Green) each from 0->255
tur.pensize(5)
tur.left(45)
tur.forward(100) 
for i in range(90):
    tur.right(1)
    tur.forward(1) 
tur.forward(50)     
tur.forward(160)
for i in range(45):
    tur.right(1)
    tur.forward(1) 

tur.forward(110)
for i in range(180):
    tur.left(1)
    tur.forward(1)

tur.forward(80)
screen.exitonclick() #Closes the window if you click on the screen
'''