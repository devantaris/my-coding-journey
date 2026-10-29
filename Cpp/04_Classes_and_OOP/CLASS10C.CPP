//largat of two with characteristic function
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
class large
  {
  private:
  int a,b;
  public:
  large (int x, int y)
    {
     a=x;
     b=y;
    }
  int compare()
    {
    if (a>b)
      return  a;
    else
      return b;
    }
  };

void main()
{
large l(2,3);
clrscr();
int x=l.compare();
cout<<x;
getch();
}