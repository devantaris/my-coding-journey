"""def summ(a,b):
    return (a+b)
c=summ(2,3)#c=5"""
"""
def summ():
    a=int(input())
    b=int(input())
    return(a+b)
#fsd
#GRER
#vfd
c=summ()
print(c)
print(summ())"""

"""a,b=9,8
t=a
a=b
b=t
print(a,b)
"""
"""#factorial
n=int(input())
fact=1
for i in range(1,n+1):
    fact=fact*i
print(fact)"""
'''
my_tuple = (4, 5, 4, 6, 6, 5)
frequency = {x: my_tuple.count(x) for x in my_tuple}
print(frequency)'''
'''def freqs(s):
    f={}
    for char in s:
        f[char]=f.get(char,0)+1
    print(f)
freqs("devanshkumar")'''

'''s=input()
l=s[::-1]
print(l)
if l==s:
    print("yes")
else:
    print("no")'''

'''def print_to_n(lst):
    if not lst:
        return
    print(lst[-1])
    print_to_n(lst[:-1])
print_to_n([1, 2, 3])'''

'''digit_map = {"Four": 4, "Five": 5, "Two": 2}
text = "Four Five Two"
numbers = [digit_map[word] for word in text.split()]
print(numbers)'''
'''
tk.Label(root, text="hello")
tk.Button(root,text="lunnnnn",command=def summm).pack()
entry=tk.Entry(root)
print(Entry.get())'''
import turtle
'''
# Create a screen
screen = turtle.Screen()
screen.bgcolor("white")  # Set background color

# Create a turtle
pen = turtle.Turtle()
pen.shape("turtle")  # Change the shape (e.g., "arrow", "circle")
pen.speed(1)  # Set the speed (1 is slow, 10 is fast)

# Drawing commands
pen.forward(100)  # Move forward by 100 units
pen.left(90)      # Turn left by 90 degrees
pen.forward(100)

# Close the canvas when clicked
screen.exitonclick()'''
import turtle

pen = turtle.Turtle()
pen.speed(10)

for i in range(100):
    pen.forward(i * 5)
    pen.right(45)

turtle.done()