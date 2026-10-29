//sum of 5 numbers
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
class sum
  {
  private:
  int a,b,c,d,e,xx;
  public:
  void getdata(int p, int q,int r,int s,int t)
    {
     a=p;
     b=q;
     c=r;
     d=s;
     e=t;
    }
  inline void add()
    {
    xx=a+b+c+d+e;
    }
  void display()
    {
    cout<<xx;
    }
  };

void main()
{
sum r;
clrscr();
r.getdata(2,3,1,4,5);
r.add();
r.display();
getch();
}