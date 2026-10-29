class tutorial { 
    static int[] getSumAndSub(int a, int b) 
    { 
        int[] ans = new int[2]; 
        ans[0] = a + b; 
        ans[1] = a - b; 
  
        return ans; 
    } 
  
    public static void main(String[] args) 
    { 
        int[] ans = getSumAndSub(100, 50); 
        System.out.println("Sum = " + ans[0]); 
        System.out.println("Sub = " + ans[1]); 
    } 
} 
