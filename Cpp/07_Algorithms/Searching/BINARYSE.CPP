
//binary search
#include<iostream.h>
#include<conio.h>

void main()
{
	int l[100] , n , element, flag =0;
	char ch;
	clrscr();
	cout<<"How many elements you want in your array: ";
	cin>>n;
	cout<<"\nEnter the values in array: ";
	for(int i = 0; i<n; i++)
	{
	     cin>>l[i];
	}
	int high=n-1 , low=0 ;
	cout<<"\nEnter the element you want to search: ";
	cin>>element;
	while(low<high)
	{
	     int mid = (low+high)/2;
	     if (l[mid]<element)
	     {
		low = mid + 1;
	     }
	     else if(l[mid] > element)
	     {
		high = mid - 1;
	     }
	     else if(l[mid]==element)
	     {
		flag = 1;
		break;
	     }
	}
	if ( flag == 1)
	{
	     cout<<"Search Successfull.";
	}
	else
	{
	     cout<<"Search Unsuccessfull.";
	}
getch();
}