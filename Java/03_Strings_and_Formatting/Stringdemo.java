class Stringdemo{
	public static void main(String a[]){
		String str = new String(" Hello");
		System.out.println(str);
		str = str.concat(" Welcome");
		System.out.println(str);
		System.out.println("Length of the String = "+str.length());
		System.out.println("Index of H = "+str.indexOf("H"));
		System.out.println("Character at index 4 = "+str.charAt(4));
		System.out.println(str.toUpperCase());
		System.out.println(str.compareTo("hello"));
		System.out.println(str.trim());
	}
}