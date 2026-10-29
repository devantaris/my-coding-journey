//DELETING AN ELEMENT FROM A POSITION
#include<iostream.h>
#include<conio.h>
void main(){
int l[100], element,n,pos;
clrscr();
cout<<"Enter the number of elements you want in your array: ";
cin>>n;
for(int i=0;i<n ;i++){
	cin>>l[i];
	}
cout<<"\nEnter the position you want to delete: ";
cin>>pos;
element=l[pos];
for (i=pos;i<n-1;i++){
	l[i]=l[i+1];
	}
cout<<"\nThis is your new array after last element deleted: ";
for(i=0; i<n-2; i++){
	cout<<l[i];
	}
cout<<"\nthe element which is deleted is: "<<element;
getch();
}