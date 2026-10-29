//multilevel inheritance volume of cube cylinder cuboid
#include<iostream.h>
#include<conio.h>
class cube
{
 protected:
  int a;
 public:
  cube(int x)
  {
  a=x;
  }
  int vol1()
  {
  return(a*a*a);
  }
};
class cylinder:public cube
{
 protected:
  int r;
 public:
  cylinder(int x,int y):cube(a)
  {
   a=x;
   r=y;
  }
 int vol2()
  {
  return ((22*r*r*a)/7);
  }
};
class cuboid:public cylinder
{
  protected:
   int c;
  public:
   cuboid(int x, int y,int z):cylinder(a,r)
   {
    a=x;
    r=y;
    c=z;
   }
  int vol3()
  {
   return(a*r*c);
  }
};

void main()
{
cuboid ss(7,2,3);
clrscr();
cout<<"volume of cube is "<<ss.vol1()<<"\n";
cout<<"volume of cylinder is "<<ss.vol2()<<"\n";
cout<<"volume of cuboid is "<<ss.vol3()<<"\n";
getch();
}
