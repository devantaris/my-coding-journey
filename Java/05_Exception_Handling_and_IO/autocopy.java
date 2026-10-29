import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JLabel;
import java.awt.Container;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.Color;

class autocopy extends JFrame{

	JTextField tf1;
	JLabel tf2;
	JButton btn1;

	public static void main(String args[]){
		autocopy frm=new autocopy();
		frm.setSize(600,400);
		frm.setVisible(true);
	}

	public autocopy(){
		Container cn = getContentPane();
		cn.setLayout(null);


		tf1=new JTextField();
		tf2=new JLabel();
		tf1.setBounds(10,10,200,30);
		tf2.setBounds(10,90,200,30);
		
		tf2.setOpaque(true);
		tf2.setBackground(Color.RED);
		
		cn.add(tf1);
		cn.add(tf2);

		tf1.addKeyListener(new KeyAdapter(){
			public void keyReleased(KeyEvent ae){
				copy(ae);
			}
		});
	}	

	public void copy(KeyEvent ae){
		System.out.println("ok");
		String str = tf1.getText();
		tf2.setText(str);
	}
}