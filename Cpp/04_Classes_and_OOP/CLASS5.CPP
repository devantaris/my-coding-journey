//nested sum of two numbers (more short)
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
  };

void main()
{
sum r;
int xx;
clrscr();
r.getdata(2,3);
xx=r.add();
cout<<xx;
getch();
}