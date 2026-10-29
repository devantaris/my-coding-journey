import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JLabel;
import java.awt.Container;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

class calc extends JFrame{

	JTextField tf1,tf2;
	JLabel tf3;
	JButton btn1,btn2,btn3,btn4;
	

	public static void main(String args[])
	{
		calc frm=new calc();
		frm.setSize(600,400);
		frm.setVisible(true);
	}

	public calc()
	{
		Container cn = getContentPane();
		cn.setLayout(null);


		tf1=new JTextField();
		tf2=new JTextField();
		tf3=new JLabel();
		btn1=new JButton("+");
		btn2=new JButton("-");
		btn3=new JButton("x");
		btn4=new JButton("/");
		tf1.setBounds(100,10,100,30);
		tf2.setBounds(100,50,100,30);
		tf3.setBounds(100,100,100,30);
		btn1.setBounds(50,150,50,50);
		btn2.setBounds(100,150,50,50);
		btn3.setBounds(150,150,50,50);
		btn4.setBounds(200,150,50,50);
		

		cn.add(tf1);
		cn.add(tf2);
		cn.add(tf3);
		cn.add(btn1);
		cn.add(btn2);
		cn.add(btn3);
		cn.add(btn4);
		btn1.addMouseListener(new MouseAdapter(){
			public void mouseClicked(MouseEvent e){
				calculate1();
			}
		});
		btn2.addMouseListener(new MouseAdapter(){
			public void mouseClicked(MouseEvent e){
				calculate2();
			}
		});
		btn3.addMouseListener(new MouseAdapter(){
			public void mouseClicked(MouseEvent e){
				calculate3();
			}
		});
		btn4.addMouseListener(new MouseAdapter(){
			public void mouseClicked(MouseEvent e){
				calculate4();
			}
		});
	}
	public void calculate1()
	{
	double n1 = Double.parseDouble(tf1.getText());
	double n2 = Double.parseDouble(tf2.getText());
	double r=n1+n2;
	tf3.setText(""+r);
	}

	public void calculate2()
	{
	double n1 = Double.parseDouble(tf1.getText());
	double n2 = Double.parseDouble(tf2.getText());
	double r=n1-n2;
	tf3.setText(""+r);
	}

	public void calculate3()
	{
	double n1 = Double.parseDouble(tf1.getText());
	double n2 = Double.parseDouble(tf2.getText());
	double r=n1*n2;
	tf3.setText(""+r);
	}

	public void calculate4()
	{
	double n1 = Double.parseDouble(tf1.getText());
	double n2 = Double.parseDouble(tf2.getText());
	double r=n1/n2;
	tf3.setText(""+r);
	}

}