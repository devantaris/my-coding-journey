//selection sort
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
       for( int k = j+1 ; k<n ; k++)
       {
	 if (l[j]>l[k]){
	       int t = l[j];
	       l[j]=l[k];
	       l[k]=t;
	       }
       }
   }
   cout<<"\nHere is your sorted array using selection sort: ";
   for (i = 0 ; i<n ; i++)
   {
      cout<<" "<<l[i];
   }
getch();
}