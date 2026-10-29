//volume of cube
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
class cube
  {
  private:
  int a;
  public:
  void getdata(int x)
    {
     a=x;
    }
  int vol()
    {
    return(a*a*a);
    }
  };

void main()
{
cube c;
int xx;
clrscr();
c.getdata(2);
xx=c.vol();
cout<<xx;
getch();
}