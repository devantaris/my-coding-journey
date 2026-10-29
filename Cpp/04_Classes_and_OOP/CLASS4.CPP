//nested sum of two numbers
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
class sum
  {
  private:
  int a,b;
  public:
  void getdata(int p, int q)
    {
     a=p;
     b=q;
    }
  int add()
    {
    return(a+b);
    }
  void display()
    {
    cout<<add();
    }
  };

void main()
{
sum r;
clrscr();
r.getdata(2,3);
r.display();
getch();
}