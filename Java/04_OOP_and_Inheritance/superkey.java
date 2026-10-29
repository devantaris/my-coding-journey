class parent{
     parent(){
        System.out.println("Parent class constructor");
    }
    int a=40;
    void display(){
        System.out.println("Parent class");
    }
}
class child extends parent{
    child(){
        super();
        System.out.println("Child class constructor");
    }
    int a=20;
    void display(){
        System.out.println("Child class");
        System.out.println("a="+a);
        System.out.println("a="+super.a);
        super.display();
    }
}

class superkey{
    public static void main(String[] args) {
        child obj=new child();
        obj.display();
    }
}