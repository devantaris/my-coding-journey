//virtual class
#include<iostream.h>
#include<conio.h>

class A
{
 protected:
  int roll;
 public:
  A()
   {}
  A(int p)
   {
   roll=p;
   }
  void display1()
   {
   cout<<"Roll no= "<<roll;
   }
};
class B: virtual public A
{
 protected:
  int m1,m2;
 public:
 B()
 {}
  B(int q,int r)
  {
  m1=q;
  m2=r;
  }
  void display2()
  {
  cout<<"\nMaths= "<<m1;
  cout<<"\nPhysics= "<<m2;
  }
};
class C : public virtual A
{
 protected:
  int pr;
 public:
 C()
 {}
  C(int s)
  {
  pr=s;
  }
  void display3()
  {
  cout<<"\nPractial= "<<pr;
  }
};
class D: public B,public C
{
 public:
 D(int p,int q,int r,int s)
 {
 p=roll;
 q=m1;
 r=m2;
 s=pr;
 }
 void t()
 {
 display1();
 display2();
 display3();
 cout<<"\n Total= "<<m1+m2+pr;
 }
};
void main()
{
D dd(2,80,90,100);
clrscr();
dd.t();
getch();
}
