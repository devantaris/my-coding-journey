
class parent{
    parent(){
        System.out.println("Parent class constructor");
    }
    int a = 221;
    void display(){
        System.out.println("Parent class method");
    }
}
class child extends parent{
    child(){
        super(); // calls parent class constructor
        System.out.println("Child class constructor called");   
    }
    int a = 20;
    void display(){
        System.out.println("Child class method");
        System.out.println("a = " + a); // prints child class variable a
        System.out.println("a = " + super.a); // prints parent class variable a
        super.display(); // calls parent class method
    }   
}
class practice2{
    public static void main(String[] args) {
        child obj = new child(); // creates object of child class
        obj.display(); // calls display method of child class
    
    }
}