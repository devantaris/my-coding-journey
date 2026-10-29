import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JLabel;
import java.awt.Container;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

class copydemo extends JFrame{

	JTextField tf1;
	JLabel tf2;
	JButton btn1;

	public static void main(String args[]){
		copydemo frm=new copydemo();
		frm.setSize(600,400);
		frm.setVisible(true);
	}

	public copydemo(){
		Container cn = getContentPane();
		cn.setLayout(null);


		tf1=new JTextField();
		tf2=new JLabel();
		btn1=new JButton("Copy");
		tf1.setBounds(10,10,200,30);
		btn1.setBounds(10,50,200,30);
		tf2.setBounds(10,90,200,30);

		cn.add(tf1);
		cn.add(tf2);
		cn.add(btn1);

		btn1.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent ae){
				copy(ae);
			}
		});
	}	

	public void copy(ActionEvent ae){
		System.out.println("ok");
		String str = tf1.getText();
		tf2.setText(str);
	}
}