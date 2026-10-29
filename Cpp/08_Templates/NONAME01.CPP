#include<iostream.h>
#include<conio.h>

void main()
{
 int a[100],b[100],c[100],m,n;
 cout<<"Enter the number of elements in A: "   ;
 cin>>m;
 cout<<"\nEnter the values in A: ";
 for (int i = 0; i<m ; i++)
   {
   cin>>a[i];
   }
 cout<<"\nEnter the number of elements in B: ";
 cin>>n;
 cout<<"\nEnter the values in B: ";
 for ( i=0 ; i<n ; i++)
   {
    cin>>b[i];
   }
 i=j=k=o;
 while(i<m && j<n)
 {
   if(a[i]<b[j])
   {
    c[k]=a[i];
    i++;
    k++;
   }
   else if(a[i]>b[j])
   {
    c[k]=b[j];
    j++;
    k++;
   }
   else
   {
    c[k]=a[i];
    i++;
    j++;
    k++;
   }
 }
 if(i<m)
 {
 while(i<m){
 c[k]=a[i];
 i++;
 k++;
 }
 } if(j<n)
 {
 while(j<n){
 c[k]=a[j];
 j++;
 k++;
 }
 }


cout<<"\nHere is the sorted and merged array C: ";
for (int s= 0; s<=k; s++)
 {
  cout<<l[s]<<" ";
 }
}