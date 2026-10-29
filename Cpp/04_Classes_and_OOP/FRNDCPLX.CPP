//friend function and return object for complex numbers
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
 friend cplx add(cplx x, cplx y)
   {
   cplx z;
   z.re=x.re+y.re;
   z.im=x.im+y.im;
   return(z);
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
c3=add(c1,c2);
c1.display();
c2.display();
  for(int i=0;i<5;i++)
  {
  cout<<"-";
  }
  cout<<"\n";
c3.display();
getch();
}
