//hierarchial Inheritance
#include<iostream.h>
#include<conio.h>

class A
{
  protected:
   int a;
  public:
   A(int x)
    {
    a=x;
    }
   int areas()
    {
    return(a*a);
    }
};
class B:public A
{
  protected:
   int b;
  public:
   B (int x,int y):A(a)
    {
    a=x;
    b=y;
    }
   int arear()
    {
    return (a*b);
    }
};
class C: public A
{
 protected:
  int b,c;
 public:
  C(int x,int y, int z):A(a)
   {
   a=x;
   b=y;
   c=z;
   }
  int vol()
   {
   return(a*b*c);
   }
};

void main()
{
B bb(2,3);
C cc(2,3,4);
clrscr();
cout<<"area of square is: "<<bb.areas();
cout<<"\narea of rectangle is: "<<bb.arear();
cout<<"\nvolume of cuboid is: "<<cc.vol();
getch();
}
