abstract class A{
    abstract void display();
    void show(){
        System.out.println("Hi");
    }   
}
class B extends A{
    void display(){
        System.out.println("Hello");
    }
}
class abstractmain{
    public static void main(String[] args){
        B obj = new B();
        obj.display();
        obj.show();
    }
}