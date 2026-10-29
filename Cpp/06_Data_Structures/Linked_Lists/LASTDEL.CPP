//DELETING AN ELEMENT FROM END
#include<iostream.h>
#include<conio.h>
void main(){
int l[100], element,n;
cout<<"Enter the number of elements you want in your array: ";
cin>>n;
for(int i=0;i<n ;i++){
	cin>>l[i];
	}
element=l[n-1];
cout<<"This is your new array after last element deleted";
for(i=0; i<n-1; i++){
	cout<<l[i];
	}
cout<<"the element which is deleted is: "<<element;
getch();
}