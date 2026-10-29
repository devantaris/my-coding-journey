//sum of two numbers
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
class sum
  {
  private:
  int a,b,c;
  public:
  void getdata(int x, int y)
    {
    a=x;
    b=y;
    }
  void add()
    {
    c=a+b;
    }
  void display()
    {
    cout<<c;
    }
  };

void main()
{
sum s;
clrscr();
s.getdata(2,3);
s.add();
s.display();
getch();
}