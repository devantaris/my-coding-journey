import javax.swing.JFrame;
import javax.swing.JButton;
import java.awt.Container;
import java.awt.event.MouseEvent;
import java.awt.event.MouseAdapter;

class blink extends JFrame
{

	JButton btn1;
	boolean cb=true;
	boolean bl=false;
	
	public static void main(String args[])
	{
		blink frm=new blink();
		frm.setSize(400,400);
		frm.setVisible(true);
	}

	public blink()
	{
	Container cn = getContentPane();
	cn.setLayout(null);
        btn1=new JButton("Blink");
	btn1.setBounds(50,150,100,100);
	cn.add(btn1);
		
	btn1.addMouseListener(new MouseAdapter()
		{
			public void mouseEntered(MouseEvent e)
			{
				changeColor();
			}
		});
    }
	class A extends Thread {
        public void run() {
            try {
                btn1.setVisible(false);
                Thread.sleep(500);
                btn1.setVisible(true);
            } catch (InterruptedException e) {
                System.out.println("Thread interrupted");
            }
        }
    }

    public void changeColor() {
        A threadA = new A();
        threadA.start();
    }
}