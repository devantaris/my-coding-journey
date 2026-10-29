#include<iostream.h>
#include<conio.h>
void main(){
int n,element,pos;
int l[100];
clrscr();
cout<<"Enter the number of elements you want in your array: \n";
cin>>n;
for(int i=0;i<n; i++){
	cin>>l[i];
	}
cout<<"Enter the position you want to add an element: ";
cin>>pos;
cout<<"Enter the elemnt you want to add In your given POSITION: ";
cin>>element;
for (int i=n-1;i>=pos,i--){
	l[i+1]=l[i];
	}
l[pos]=element;
cout<<"Here is your new array: ";
for(i=0;i<=n;i++){
	cout<<l[i];
	}
getch();
}