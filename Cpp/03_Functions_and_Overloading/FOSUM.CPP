//sum of 2,3,4,5 numbers
#include<stdio.h>
#include<conio.h>
#include<iostream.h>
sum (int a ,int b)
{
return(a+b);
}
sum (int a,int b,int c)
{
return (a+b+c);
}
sum (int a,int b,int c,int d)
{
return(a+b+c+d);
}
sum (int a, int b,int c,int d,int e)
{
return(a+b+c+d+e);
}
   void main()
   {
   int ss,sss,ssss,sssss,a,b,c,d,e;
   clrscr();
   cout<<"Enter 5 integers: ";
   cin>>a>>b>>c>>d>>e;
   ss=sum(a,b);
   sss=sum(a,b,c);
   ssss=sum(a,b,c,d);
   sssss=sum(a,b,c,d,e);
   cout<<"sum of 1st two numbers is: "<<ss;
   cout<<"\nsum of 1st three numbers is: " <<sss;
   cout<<"\nsum of 1st four numbers is: "<<ssss;
   cout<<"\nsum of all five numbers is: "<<sssss;
   getch();
   }


