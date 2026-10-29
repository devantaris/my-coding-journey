#include<iostream.h>
#include<conio.h>

template <class T>
T max(T a, T b)
   {
   return (a>b)?a:b;
   }

void main()
{
 int a,b;
 float i,j;
 char c1,c2;
   cin>>a>>b;
   cout<<max(a,b);
   cin>>i>>j;
   cout<<max(i,j);
   cin>>c1>>c2;
   cout<<max(c1,c2);
getch();
}
