/**
 * This Time object class represents a particular time of day such as
 * 1:00 PM or 12:00 AM.
 * 
 * @author Brian Chan
 *
 */

public class Time implements Cloneable, Comparable<Time> {
	private int hour;
	private int minute;
	private boolean PM;
	
	/**
	 * Initializes a new Time object. PM represents whether the time
	 * is in the AM (false) or PM (true)
	 * @param hour The Time's hour. Hour must be between 1 and 12.
	 * @param minute The Time's minute. Minute must be between 0 and 59.
	 * @param PM Whether the Time is AM or PM
	 * @exception IllegalArgumentException If hour < 1 or > 12 or minute < 0 or > 59
	 */
	public Time(int hour, int minute, boolean PM) {
		if (hour < 1 || hour > 12) {
			throw new IllegalArgumentException("Hour must be between 1 and 12.");
		}
		
		if (minute < 0 || minute > 59) {
			throw new IllegalArgumentException("Minute must be between 1 and 59.");
		}
		
		this.hour = hour;
		this.minute = minute;
		this.PM = PM;
	}

	/**
	 * Returns the Time object's hour
	 * @return An integer representing the Time's hour
	 */
	public int getHour() {
		return this.hour;
	}
	
	/**
	 * Returns the Time object's minute
	 * @return An integer representing the Time's minute
	 */
	public int getMinute() {
		return this.minute;
	}
	
	/**
	 * Returns true if this Time object occurs between 12:00 PM
	 * and 11:59 PM INCLUSIVE
	 * @return True if Time is PM, false otherwise
	 */
	public boolean isPM() {
		return this.PM;
	}
	
	/**
	 * Returns a string representation of the Time object
	 */
	public String toString() {
		String hour = Integer.toString(this.hour);
		
		// Adds a 0 before the hour if the hour is < 10
		if (this.hour < 10) {
			hour = "0" + this.hour;
		}
		
		String minute = Integer.toString(this.minute);
		
		// Adds a 0 before the minute if the minute is < 10
		if (this.minute < 10) {
			minute = "0" + this.minute;
		}
		
		if (this.PM) {
			return hour + ":" + minute + " PM";
		} 
		return hour + ":" + minute + " AM";
	}
	
	/**
	 * Accepts a string such as 1:00 PM, converts it to a Time object
	 * and returns the Time object
	 * @param str A string representation of the time.
	 * @return A Time object representing the String value passed as a parameter
	 * @exception IllegalArgumentException If str cannot be parsed as a time or if str is null
	 */
	public static Time fromString(String str) {
		if (str.equals(null)) {
			throw new IllegalArgumentException();
		}
		
		// When given hour >= 10
		if (str.subSequence(2, 3).equals(":")) {
			String hour = str.substring(0, 2);
			String minute = str.substring(3, 5);
			String period = str.substring(6, 8).toUpperCase();
			boolean pm = true;
			
			if (period.equals("AM")) {
				pm = false;
			}
			
			return new Time(Integer.parseInt(hour), Integer.parseInt(minute), pm);
		
		// case when given hour is < 10
		} else if (str.subSequence(1, 2).equals(":")) {
			String hour = "0" + str.substring(0, 1);
			String minute = str.substring(2, 4);
			String period = str.substring(5, 7).toUpperCase();
			boolean pm = true;
			
			if (period.equals("AM")) {
				pm = false;
			}
			
			return new Time(Integer.parseInt(hour), Integer.parseInt(minute), pm);
		} else {
			throw new IllegalArgumentException("The given start time is not in valid format.");
		}
		
		
	}
	
	/**
	 * Returns a copy of the object
	 */
	public Time clone() {
		// need to use try/catch to call Object's clone method
		
		try {
			Time copy = (Time) super.clone();
			return copy;
		} catch (CloneNotSupportedException e) {
			// never happens because I implemented Cloneable
			return null;
		}
	}
	
	/**
	 * Returns an integer indicating this Time object's placement
	 * in comparison to a given Time object
	 * @param other A Time object to be compared
	 * @return An integer representing the ordering
	 */
	public int compareTo(Time other) {
		int hour1 = 0;
		int hour2 = 0;
		
		// convert to minutes then compare the times
		
		// case when time is PM and after 12 PM
		if (this.PM && this.hour != 12) {
			hour1 = (this.hour + 12) * 60;
		}
		
		if (other.PM && other.hour != 12) {
			hour2 += (other.hour + 12) * 60;
		}
		
		// case when hour is 12 PM or time is AM
		if (this.PM && this.hour == 12 || !this.PM) {
			hour1 = this.hour * 60;
		}
		
		if (other.PM && other.hour == 12 || !this.PM) {
			hour2 = other.hour * 60;
		}
		
		// add minutes
		hour1 += this.minute;
		hour2 += other.minute;
		
		return hour1 - hour2;
	}

	/**
	 * Returns true if and only if this Time object has the same state
	 * of the passed in Time object
	 * @param other A time object
	 * @return A boolean
	 */
	public boolean equals(Time other) {		
		return this.getHour() == other.getHour() && this.getMinute() == other.getMinute() 
				&& this.isPM() == other.isPM();
	}
	
	/**
	 * Adjusts this Time object forward by the given number of 
	 * minutes. Throws an exception if minutes < 0.
	 * @param minutes Minutes to shift the time by
	 * @exception IllegalArgumentException Minutes < 0
	 */
	public void shift(int minutes) {
		if (minutes < 0) {
			throw new IllegalArgumentException("Minutes cannot be less than 0.");
		}
		
		int new_hour = this.hour;
		int new_minute = this.minute + minutes;
		
		if (new_minute < 60) {
			this.minute += minutes;
		} else {
			// convert to 24 hour time
			if (this.PM) {
				new_hour += 12;
			}
			
			// 12 AM case
			if (new_hour == 12 && !this.PM) {
				new_hour = 0;
			}
			
			// Add new_minutes for each hour
			while (new_minute >= 60) {
				new_hour += 1;
				new_minute -= 60;
			}
			
			if (new_hour % 24 >= 12 || (this.hour == 12 
					&& this.PM && new_hour > 24)) {
				this.PM = true;
			} else {
				this.PM = false;
			}
			
			this.hour = new_hour % 24;
			
			if (this.hour == 0) {
				this.hour = 12;
			}
			
			if (this.hour > 12) {
				this.hour = this.hour % 12;
			}
			
			this.minute = new_minute;
		}
	}
	
}
