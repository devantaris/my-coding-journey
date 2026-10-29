public class outofbound {
    public static void add(int a,int b)
    {
        System.out.println("Sum of the numbers is : "+(a+b));
    }
    public static void main(String args[])
    {
        int[] arr = { 1, 2, 3, 4, 5 };
        try{
        add(arr[3],arr[5]);
        }
        catch(ArrayIndexOutOfBoundsException e){
            System.out.println("Array index is out of bound");
        }
        finally{
            System.out.println("Done");
        }
        
        

    }
}
