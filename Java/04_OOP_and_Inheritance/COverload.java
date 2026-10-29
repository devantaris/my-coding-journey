class A {
	A(){
		System.out.println("Constructor 1 without arguments");
	}
	A(int a){
		System.out.println("Costructor 2 with one argument");
		System.out.println("a = "+a);
	}
}
class COverload {
	public static void main(String ards[]){ 
		 A aa=new A();
		 A aaa=new A(10);
	} 
}