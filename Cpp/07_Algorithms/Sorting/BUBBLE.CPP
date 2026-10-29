//bubble sort
#include<iostream.h>
#include<conio.h>

void main()
{
   int l[100], n;
   clrscr();
   cout<<"Enter the number of elements you want: ";
   cin>>n;
   cout<<"\nEnter the values now: ";
   for(int i = 0 ; i<n ; i++)
   {
       cin>>l[i];
   }
   for(int j = 0 ; j<n-1; j++)
   {
       for( int k = 0 ; k<n-j-1 ; k++)
       {
	   if ( l[k] > l[k+1])
	     {
	       int t = l[k];
	       l[k]=l[k+1];
	       l[k+1]=t;
	   }
       }
   }
   cout<<"\nHere is your sorted arrau using bubble sort: ";
   for (i = 0 ; i<n ; i++)
   {
      cout<<" "<<l[i];
   }
getch();
}