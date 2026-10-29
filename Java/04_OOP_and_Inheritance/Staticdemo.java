class demo{
	static int a = 10;
	static void display(){
		System.out.println("Static Method");
	}
	static{
		System.out.println("Static Block");
	}
}
class Staticdemo{
	public static void main(String a[]){
		System.out.println(demo.a);
		demo.display();
	}
}