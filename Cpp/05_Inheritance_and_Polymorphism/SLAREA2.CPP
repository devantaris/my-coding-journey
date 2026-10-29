//single level inheritance area of square and volume od cubid
#include<iostream.h>
#include<conio.h>
class sq
{
public:
 int a;
 void getdata(int x)
  {
  a=x;
  }
 int area()
  {
  return (a*a);
  }
};
class cuboid:public sq
{
public:
int b,c;
 void getdata(int x,int y,int z)
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
cuboid xx;
clrscr();
xx.getdata(2,3,4);
int n=xx.area();
int m=xx.vol();
cout<<n<<"\n";
cout<<m;
getch();
}












































































































































































































































































































































































