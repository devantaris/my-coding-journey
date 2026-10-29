package pack1;


import java.math.BigInteger;

public class factorialpack{

    public void factorial(int n){
        BigInteger f=BigInteger.ONE;
        for (int i = 1; i<=n ; i++){
            f= f.multiply(BigInteger.valueOf(i));
        }
        System.out.println("The factorial of "+n+" is "+ f);
    }
}