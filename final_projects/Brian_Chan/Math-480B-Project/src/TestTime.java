/*
Brian Chan

Tests the Time class.
*/

public class TestTime {

	public static void main(String[] args) {
		//testToString();
		//testFromString();
		//checkEquals();
		//testCompareTo();
		testShift();
	}
	
	// Tests the functionality of toString()
	public static void testToString() {
		Time t = new Time(12, 0, true);
		System.out.println(t.toString());
		System.out.println(t.isPM());
		
		Time t2 = new Time(9, 12, false);
		System.out.println(t2.toString());
		System.out.println(t2.isPM());
	}
	
	// Tests the functionality of fromString
	public static void testFromString() {
		System.out.println(Time.fromString("12:30 PM").toString());
		
		System.out.println(Time.fromString("1:30 PM").toString());
	}
	
	// Tests the functionality of equals
	public static void checkEquals() {
		Time t1 = new Time(12, 30, true);
		Time t2 = new Time(12, 30, true);
		Time t3 = new Time(12, 30, false);
		
		System.out.println(t1.equals(t2));
		System.out.println(t2.equals(t1));
		System.out.println(t1.equals(t3));
		System.out.println(t2.equals(t3));
	}
	
	// Test compareTo
	public static void testCompareTo() {
		Time t1 = new Time(12, 30, true);
		Time t2 = new Time(12, 30, false);
		Time t3 = new Time(9, 30, false);
		
		System.out.println(t1.compareTo(t1));
		System.out.println(t1.compareTo(t2));
		System.out.println(t2.compareTo(t1));
		System.out.println(t3.compareTo(t1));
	}
	
	// Tests the functionality of Time's shift method
	public static void testShift() {
		Time t = new Time(12, 30, true);
		//t.shift(-1);	// throws exception
		t.shift(20);
		System.out.println("12:50 PM 	" + t);	// 12:50 PM
		
		Time t2 = new Time(12, 30, true);
		t2.shift(120);
		System.out.println("02:30 PM 	" + t2);	// 02:30 PM
		
		Time t3 = new Time(9, 30, false);
		t3.shift(120);
		System.out.println("11:30 AM 	" + t3);	// 11:30 AM
		
		Time t4 = new Time(11, 30, false);
		t4.shift(30);
		System.out.println("12:00 PM 	" + t4);	// 12:00 PM
		
		Time t5 = new Time(11, 30, true);
		t5.shift(30);
		System.out.println("12:00 AM 	" + t5);	// 12:00 AM
		
		Time t6 = new Time(11, 30, false);
		t6.shift(50);
		System.out.println("12:20 PM 	" + t6);	// 12:20 PM
		
		Time t7 = new Time(10, 30, true);
		t7.shift(190);
		System.out.println("01:40 AM 	" + t7);	// 01:40 AM
		
		Time t8 = new Time(10, 30, false);
		t8.shift(190);
		System.out.println("01:40 PM 	" + t8);	// 01:40 PM
		
		// shift by one full day
		Time t9 = new Time(10, 30, false);
		t9.shift(1440);
		System.out.println("10:30 AM 	" + t9);	// 10:30 AM
		
		Time t10 = new Time(3, 30, true);
		t10.shift(248);
		System.out.println("07:38 PM 	" + t10);	// 07:38 PM
		
		Time t11 = new Time(12, 30, false);
		t11.shift(50);
		System.out.println("01:20 AM 	" + t11);	// 01:20 AM
	}
}
