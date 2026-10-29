/*searching*/
#include<stdio.h>
#include<conio.h>
#include<iostream.h>
void main()
{
int a[100],n,i,el,flag=0;
clrscr();
cout<<"Enter the number of elemnts you will give: ";
cin>>n;
cout<<"Enter the values of array: ";
for (i=0;i<n;i++)
    {
    cin>>a[i];
    }
    cout<<"Enter the element you want to search; ";
    cin>>el;
    for (i=0;i<n;i++)
	{
	if (a[i] == el)
	   {
	   flag=1;
	   break;
	   }
	}
    if (flag==1)
       cout<<"element found in array";
    else
    cout<<"element not found";
    getch();
}