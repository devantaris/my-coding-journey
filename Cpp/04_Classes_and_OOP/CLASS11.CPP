//factorial with characteristic function
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
class factorial
  {
  private:
  int n;
  public:
  factorial (int a)
    {
     n=a;
    }
  int calculate()
    {
    int f=1;
     for (int i=1;i<=n;i++)
      {
      f=f*i;
      }
      return f;
    }
  };

void main()
{
factorial k(5);
clrscr();
int x=k.calculate();
cout<<x;
getch();
}