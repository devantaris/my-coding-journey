#include<iostream.h>
#include<conio.h>
void main(){
int n,element;
int l[100];
clrscr();
cout<<"Enter the number of elements you want in your array: \n";
cin>>n;
for(int i=0;i<n; i++){
	cin>>l[i];
	}
cout<<"Enter the elemnt you want to add AT THE END: ";
cin>>element;
l[n]=element;
cout<<"Here is your new array: ";
for(i=0;i<=n;i++){
	cout<<l[i];
	}
getch();
}