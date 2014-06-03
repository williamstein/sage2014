/*
Brian Chan

Tests Schedule.java.
*/

import java.util.*;

public class TestSchedule {

	public static void main(String[] args) {
		Schedule s = createSchedule();
		System.out.println(s.totalCredits());
		System.out.println(s);
		
		testGetCourse(s);
		testRemove(s);
	}
	
	// Creates a new schedule
	public static Schedule createSchedule() {
		Time t1 = new Time(12, 30, true);
		Time t2 = new Time(11, 30, false);
		Time t3 = new Time(9, 30, false);
		Set<Weekday> d1 = new HashSet<Weekday>();
		d1.add(Weekday.MONDAY);
		d1.add(Weekday.WEDNESDAY);
		d1.add(Weekday.FRIDAY);
		
		Course c1 = new Course("Math 480", 3, d1, t1, 50);
		Course c2 = new Course("Math 324", 3, d1, t2, 50);
		Course c3 = new Course("Math 462", 3, d1, t3, 50);
		
		Schedule s = new Schedule();
		s.add(c1);
		s.add(c2);
		s.add(c3);
		
		return s;
	}
	
	// Tests getCourse
	public static void testGetCourse(Schedule s) {
		Time t1 = new Time(12, 30, true);
		Time t2 = new Time(11, 30, false);
		
		System.out.println(s.getCourse(Weekday.MONDAY, t1));
		System.out.println(s.getCourse(Weekday.WEDNESDAY, t1));
		System.out.println(s.getCourse(Weekday.FRIDAY, t1));
		System.out.println(s.getCourse(Weekday.MONDAY, t2));
		System.out.println(s.getCourse(Weekday.TUESDAY, t2));
	}
	
	// Tests remove
	public static void testRemove(Schedule s) {
		Time t1 = new Time(12, 30, true);
		Time t2 = new Time(11, 30, false);
		
		s.remove(Weekday.MONDAY, t1);
		s.remove(Weekday.TUESDAY, t2);
		//s.remove(Weekday.FRIDAY, t2);
		s.remove(Weekday.MONDAY, t2);
		System.out.println(s.toString());
	}
	
	
}
