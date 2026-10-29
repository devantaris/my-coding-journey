class AB implements A, B {
    public void display(){
        System.out.println("Hello");
    }
    public void show(){
        System.out.println("Hi");
    }
}
class InterfaceAB{
    public static void main(String[] args){
        AB obj = new AB();
        obj.display();
        obj.show();
    }
}   // Output: Hello
    //         Hi