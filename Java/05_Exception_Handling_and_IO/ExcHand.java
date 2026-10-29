class Ex{
    void display(){
        try{
            int a = 5/0;
        }catch(ArithmeticException e){
            System.out.println("Arithmetic Exception");
        }
    }
    void show(){
        int a[] = new int[5];
        try{
            a[6] = 9;
        }catch(ArrayIndexOutOfBoundsException e){
            System.out.println("Array Index Out Of Bounds Exception");
        }
}
}
class ExcHand{
    public static void main(String[] args){
        Ex obj = new Ex();
        obj.display();
        obj.show();
    }
}