#include<iostream.h>
#include<conio.h>

void main()
{
   int l[100],n;
   cout<<"How many elements do you want?: ";
   cin>>n;
   cout<<"\n Enter the valuew now: ";
   for(int i =0 ; i<n ; i++)
     {
      cin>>l[i];
     }
   cout<<"\nStarted insertion sorting";

   for( i = 1 ; i <= n-1 ; i++)
     {
      int temp = l[i];
      int j = i-1;
      while (temp<l[j] && j>=0)
       {
	l[j+1] = l[j];
	j--;
       }
     l[j+1]=temp;
     }
  cout<<"\nThis is your sorted array : ";
  for (i=0;i<n;i++){
    cout<<l[i]<<" ";
    }
getch();
}