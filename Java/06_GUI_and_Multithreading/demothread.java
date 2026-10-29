class work1 extends Thread
{
    public void run()
    {
        for (int i=1; i<=10;i++)
        {
            System.out.println("work1=="+i);
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                System.out.println("Work2 on sleep.");
            }
        }
    }
}
class work2 extends Thread
{
    public void run()
    {
        for (int i=1; i<=10;i++)
        {
            System.out.println("work2-->"+i);
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                System.out.println("Work2 interrupted: ");
            }
        }
    }
}
class demothread
{
    public static void main(String[] args) {
        System.out.println("Start");
        work1 w1=new work1();
        System.out.println("Step 1");
        work2 w2=new work2();
        System.out.println("Step 2");
        w1.start();
        System.out.println("Step 3");
        w2.start();
        System.out.println("End");
    }
}