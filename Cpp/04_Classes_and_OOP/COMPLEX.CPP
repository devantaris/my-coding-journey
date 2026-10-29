#include<iostream.h>
#include<conio.h>

class cplx
{
  int re,im;
 public:
  cplx()
   {}
  cplx(int x,int y)
   {
   re=x;
   im=y;
   }
  void add(cplx x, cplx y)
   {
   re=x.re+y.re;
   im=x.im+y.im;
   }
  void display()
   {
   cout<<re<<"+i"<<im<<"\n";
   }
};

void main()
{
cplx c1(3,4), c2(5,4), c3;
clrscr();
c3.add(c1,c2);
c1.display();
c2.display();
cout<<"--------------\n";
c3.display();
getch();
}
