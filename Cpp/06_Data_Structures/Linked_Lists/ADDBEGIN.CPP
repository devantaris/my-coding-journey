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
cout<<"Enter the element you want to add AT THE BENIGINNING: ";
cin>>element;
for (i=n-1;i>=0;i--){
	l[i+1]=l[i];
	}
l[0]=element;
cout<<"Here is your new array: ";
for(i=0;i<=n;i++){
	cout<<l[i];
	}
getch();
}