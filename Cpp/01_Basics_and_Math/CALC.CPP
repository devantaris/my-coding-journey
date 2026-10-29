/*calculator*/
#include<stdio.h>
#include<conio.h>
#include<iostream.h>
void main()
{
int a,b,s;
char ch;
clrscr();
cout<<"two numbers= ";
cin>>a>>b;
cout<<"enter the choice form / * - + : ";
cin>>ch;

switch (ch)
{
case '+':{
	    s=a+b;
	    cout<<"sum of numbers is = "<<s;
	    }
	    break;
case '-':{
	    s=a-b;
	    cout<<"subtraction is= "<<s;
	    }
	    break;
case '*': {
	    s=a*b;
	    cout<<"multiplication is= "<<s;
	    }
	    break;
case '/': {
	    s=a/b;
	    cout<<"division is= "<<s;
	    }
	    break;

default: cout<<"wrong choice ";
}
getch();
}