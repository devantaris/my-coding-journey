//DELETING AN ELEMENT FROM beginning
#include<iostream.h>
#include<conio.h>
void main(){
int l[100], element,n;
clrscr();
cout<<"Enter the number of elements you want in your array: ";
cin>>n;
for(int i=0;i<n ;i++){
	cin>>l[i];
	}

element=l[0];
for (i=0;i<n-1;i++){
	l[i]=l[i+1];
	}
cout<<"\nThis is your new array after first element deleted: ";
for(i=0; i<n-1; i++){
	cout<<l[i];
	}
cout<<"\nthe element which is deleted is: "<<element;
getch();
}