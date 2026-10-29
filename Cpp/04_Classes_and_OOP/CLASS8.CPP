//volume of cuboid with characteristic function
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
class cuboid
  {
  private:
  int l,b,h;
  public:
  cuboid (int x, int y, int z)
    {
     l=x;
     b=y;
     h=z;
    }
  int vol()
    {
    return(l*b*h);
    }
  };

void main()
{
cuboid c(2,3,4);
clrscr();
int a=c.vol();
cout<<a;
getch();
}