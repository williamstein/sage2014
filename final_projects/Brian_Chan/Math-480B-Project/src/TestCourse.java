/*
Brian Chan

Tests the Course class.
*/

import java.util.*;

public class TestCourse {
	
	public static void main(String[] args) {
		//testEquals();
		//testGetEndTime();
		
		//testContains();

		testConflictsWith();
	}
	
	public static void testEquals() {
		Time t = new Time(12, 30, true);
		Set<Weekday> d = new HashSet<Weekday>();
		d.add(Weekday.MONDAY);
		d.add(Weekday.WEDNESDAY);
		d.add(Weekday.FRIDAY);
		
		Course c = new Course("Math 480", 3, d, t, 50);
		System.out.println(c.equals(c));
		
		// Check that times are different
		Time t2 = new Time(12, 30, false);
		Course c2 = new Course("Math 480", 3, d, t2, 50);
		System.out.println(c.equals(c2));
		
		// Test name
		Course c3 = new Course("Math 124", 3, d, t, 50);
		System.out.println(c.equals(c3));
		
		// Check credits are different
		Course c4 = new Course("Math 480", 5, d, t, 50);
		System.out.println(c.equals(c4));
		
		// Check duration
		Course c5 = new Course("Math 480", 3, d, t, 40);
		System.out.println(c.equals(c5));
		
	}
	
	// Tests getEndTime()
	public static void testGetEndTime() {
		Time t = new Time(12, 30, true);
		Set<Weekday> d = new HashSet<Weekday>();
		d.add(Weekday.MONDAY);
		d.add(Weekday.WEDNESDAY);
		d.add(Weekday.FRIDAY);
		
		Course c = new Course("Math 480", 3, d, t, 50);
		System.out.println(c.getEndTime());
		
		Time t2 = new Time(12, 30, false);
		Course c2 = new Course("Math 480", 3, d, t2, 50);
		System.out.println(c2.getEndTime());
	}
	
	// Tests contains
	public static void testContains() {
		Time t = new Time(12, 30, true);
		Set<Weekday> d = new HashSet<Weekday>();
		d.add(Weekday.MONDAY);
		d.add(Weekday.WEDNESDAY);
		d.add(Weekday.FRIDAY);
		
		Course c = new Course("Math 480", 3, d, t, 50);
		System.out.println(c.contains(Weekday.MONDAY, t)); // true
		System.out.println(c.contains(Weekday.TUESDAY, t)); // false
		System.out.println(c.contains(Weekday.WEDNESDAY, t)); // true
		System.out.println(c.contains(Weekday.THURSDAY, t)); // false
		System.out.println(c.contains(Weekday.FRIDAY, t)); // true
		
		Time t2 = new Time(12, 30, false);
		Time t3 = new Time(10, 30, true);
		Time t4 = new Time(12, 40, true);
		
		System.out.println(c.contains(Weekday.MONDAY, t2));	// false
		System.out.println(c.contains(Weekday.MONDAY, t3));	// false
		System.out.println(c.contains(Weekday.MONDAY, t4));	// true
	
		Course c2 = new Course("Math 124", 3, d, t3, 50);
		System.out.println(c2.contains(Weekday.MONDAY, t2)); // false
		System.out.println(c2.contains(Weekday.MONDAY, t3)); // true
		Time t5 = new Time(11, 19, true);
		System.out.println(c2.contains(Weekday.MONDAY, t5)); // true
	}
	
	// Tests conflictsWith
	public static void testConflictsWith() {
		Time t0 = new Time(12, 30, true);
		Set<Weekday> d = new HashSet<Weekday>();
		d.add(Weekday.MONDAY);
		d.add(Weekday.WEDNESDAY);
		d.add(Weekday.FRIDAY);
		
		Course c = new Course("Math 480", 3, d, t0, 50);
		System.out.println(c.conflictsWith(c));	// true
		
		Time t1 = new Time(10, 30, false);
		Course c2 = new Course("Math 124", 3, d, t1, 50); // false
		System.out.println(c.conflictsWith(c2));
		
		Time t2 = new Time(12, 30, false);
		Course c3 = new Course("Math 480", 3, d, t2, 50);
		System.out.println(c.conflictsWith(c3)); // false
		
		Set<Weekday> d2 = new HashSet<Weekday>();
		//d2.add(Weekday.TUESDAY);
		d2.add(Weekday.WEDNESDAY);
		Course c4 = new Course("Math 407", 3, d2, t0, 50); // true
		System.out.println(c.conflictsWith(c4));
		
		Time t3 = new Time(1, 15, true);
		Course c5 = new Course("Math 407", 3, d2, t3, 50); // true
		System.out.println(c.conflictsWith(c5));
		
	}

}
