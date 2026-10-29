//nested area of rect (more short)
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
class rect
  {
  private:
  int a,b;
  public:
  void getdata(int p, int q)
    {
     a=p;
     b=q;
    }
  int area()
    {
    return(a*b);
    }
  };

void main()
{
rect r;
int xx;
clrscr();
r.getdata(2,3);
xx=r.area();
cout<<xx;
getch();
}