/**
 * This program stores information about a particular university course 
 * including name, credits, days, start time and duration.
 * 
 * @author Brian Chan
 */

import java.util.*;

public class Course {
	private String name;
	private int credits;
	private Set<Weekday> days;
	private Time startTime;
	private int duration;
	
	/**
	 * Initializes a new Course object
	 * @param name The name of the course.
	 * @param credits The number of credits the course is.
	 * @param days The days of the week in which the course is in session.
	 * @param startTime The time the class starts.
	 * @param duration The duration of the course (in minutes).
	 * @exception IllegalArgumentException If duration or credits are < 1
	 */
	public Course(String name, int credits, Set<Weekday> days, Time startTime, int duration) {
		if (duration < 1) {
			throw new IllegalArgumentException("Duration cannot be less than 1.");
		}
		
		if (credits < 1 || credits > 5) {
			throw new IllegalArgumentException("The course must be between 1 and 5 credits.");
		}
		
		if (days.isEmpty()) {
			throw new IllegalArgumentException("The course must meet at least one day of the week.");
		}
		
		this.name = name;
		this.credits = credits;
		this.days = new TreeSet<Weekday>(days);
		this.startTime = startTime;
		this.duration = duration;
	}
	
	/**
	 * Returns the number of credits of the course
	 * @return An integer
	 */
	public int getCredits() {
		return this.credits;
	}

	/**
	 * Returns the name of the course
	 * @return A String
	 */
	public String getName() {
		return this.name;
	}
	
	/**
	 * Returns the start time of the course
	 * @return A Time object
	 */
	public Time getStartTime() {
		return this.startTime;
	}
	
	/**
	 * Returns the duration of the course
	 * @return An integer
	 */
	public int getDuration() {
		return this.duration;
	}
	
	/**
	 * Returns a string representation of the course
	 * @return A String
	 */
	public String toString() {
		String days= "";
		for (Weekday d : this.days) {
			days += d.toShortName();
		}
		
		return this.name + ", " + this.credits + ", " + days + ", " +
				this.startTime + ", " + this.duration;
	}
	
	/**
	 * Returns true if and only if o refers to a Course object with 
	 * exactly equivalent state as this one
	 * @param o A Course object to be compared to
	 * @return A boolean
	 */
	public boolean equals(Course o) {
		return this.name.equals(o.getName()) && this.getCredits() == o.getCredits() &&
				this.days.equals(o.days) && this.startTime.equals(o.startTime) 
				&& this.duration == o.duration;
	}
	
	// Returns true if this course is in session during the day(s)
	// and time(s) that overlap with the given course
	public boolean conflictsWith(Course c) {
		Time start = c.getStartTime();
		Time end = c.getEndTime();
		Set<Weekday> days = c.days;
		
		// Go through each day that the class is in session and see if it
		// conflicts with this course object
		for (Weekday d : days) {
			// Check the start end end times and see if they conflict
			boolean startTime = contains(d, start);
			boolean endTime = contains(d, end);
			
			if (startTime || endTime) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Returns true if this course is in session during the given
	 * day and times. Start times are inclusive while end times are exclusive
	 * @param d A day of the week
	 * @param t A time of the day
	 * @return A boolean
	 */
	public boolean contains(Weekday d, Time t) {
		Time t0 = this.startTime;
		Time end = getEndTime();
		
		if (days.contains(d)) {
			// check if start times match
			if (t0.equals(t)) {
				return true;
			
			// check times in between the start and end times
			} else if (t0.compareTo(t) < 0 && end.compareTo(t) > 0) {
				return true;
				
			// no matches
			} else {
				return false;
			}
		} 
		return false;
	}
	
	/**
	 * Returns the end time of the course
	 * @return A boolean
	 */
	public Time getEndTime() {
		int hour = this.startTime.getHour();
		int minute = this.startTime.getMinute();
		boolean period = this.startTime.isPM();
		
		Time t = new Time(hour, minute, period);
		t.shift(this.duration);
		return t;
	}

}
