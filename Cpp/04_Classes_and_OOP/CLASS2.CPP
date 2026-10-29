//area of rectangle
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
class rect
  {
  private:
  int l,b,h;
  public:
  void getdata(int x, int y)
    {
    l=x;
    b=y;
    }
  void area()
    {
    h=l*b;
    }
  void display()
    {
    cout<<h;
    }
  };

void main()
{
rect r;
clrscr();
r.getdata(2,3);
r.area();
r.display();
getch();
}