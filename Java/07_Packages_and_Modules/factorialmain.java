import java.util.Scanner;

import pack1.factorialpack;

public class factorialmain {
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter an Integer. ");
        int n = sc.nextInt();
        factorialpack ff= new factorialpack();
        ff.factorial(n);
    }
}
