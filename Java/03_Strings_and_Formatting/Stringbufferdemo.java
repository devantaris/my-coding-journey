class Stringbufferdemo{
	public static void main (String a[]){
		StringBuffer str = new StringBuffer("WELCOME");
		System.out.println(str);
		System.out.println(str.append(" to JAVA"));
		System.out.println(str.insert(4,"HOW"));
		System.out.println(str.delete(4,7));
		System.out.println(str.reverse());
	}
}