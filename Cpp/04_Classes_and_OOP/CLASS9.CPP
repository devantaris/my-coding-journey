//simple interst with characteristic function
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
class simple
  {
  private:
  int p,r,t;
  public:
  simple (int x, int y, int z)
    {
     p=x;
     r=y;
     t=z;
    }
  int si()
    {
    return((p*r*t)/100);
    }
  };

void main()
{
simple s(1000,10,2);
clrscr();
int a=s.si();
cout<<a;
getch();
}