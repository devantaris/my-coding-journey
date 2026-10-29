//single level inheritance area of square and rectangle
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
 int area1()
  {
  return (a*a);
  }
};
class rc:public sq
{
public:
int b;
 void getdata(int x,int y)
  {
  a=x;
  b=y;
  }
  int area2()
  {
  return(a*b);
  }
};

void main()
{
rc ss;
clrscr();
ss.getdata(2,3);
int n=ss.area1();
int m=ss.area2();
cout<<n<<"\n";
cout<<m;
getch();
}












































































































































































































































































































































































