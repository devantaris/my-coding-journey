public class practice{
    public static void main (String args[]){
        String sr = "hello world";
        String sr1 = "devansh kumar";
        System.out.println("Length of string sr is "+ sr.length());
        System.out.println(sr1.length());
        System.out.println(sr.charAt(0)); // prints first character of string
        System.out.println(sr.toUpperCase()); // converts string to upper case
        System.out.println(sr.toLowerCase()); // converts string to lower case
        System.out.println(sr.indexOf('h')); // returns index of first occurrence of 'h'
        if (sr.compareTo(sr1)>0){
            System.out.println("sr is greater than sr1");
        }else if (sr.compareTo(sr1)<0){
            System.out.println("sr is less than sr1");
        }else{
            System.out.println("sr is equal to sr1");
        }

    }
}