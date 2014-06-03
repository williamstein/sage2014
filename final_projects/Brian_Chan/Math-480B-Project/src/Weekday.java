/**
 * Enumeration that represents the five days (M-F) of the week for courses.
 * 
 * @author Brian Chan
 */

public enum Weekday {
	MONDAY("M"), TUESDAY("T"), WEDNESDAY("W"), THURSDAY("R"), FRIDAY("F");
	
	private String day;
	
	/**
	 * Initializes a new Weekday object
	 * @param day A day string
	 * @exception IllegalArgumentException Cannot pass in a null day
	 */
	private Weekday(String day) {
		if (day.equals(null)) {
			throw new IllegalArgumentException("Day cannot be null");
		}
		
		this.day = day;
	}
	
	/**
	 * Converts a string into the equivalent Weekday enum value.
	 * @param s A string that should match a Weekday value or its one letter name
	 * @return An equivalent enum value
	 * @throws IllegalArgumentException If the given string does not match any enum
	 */
	public static Weekday fromString(String s) {
		if (s.toLowerCase().equals("m") || s.toLowerCase().equals("monday")) {
			return MONDAY;
		} else if (s.toLowerCase().equals("t") || s.toLowerCase().equals("tuesday")) {
			return TUESDAY;
		} else if (s.toLowerCase().equals("w") || s.toLowerCase().equals("wednesday")) {
			return WEDNESDAY;
		} else if (s.toLowerCase().equals("r") || s.toLowerCase().equals("thursday")) {
			return THURSDAY;
		} else if (s.toLowerCase().equals("f") || s.toLowerCase().equals("friday")) {
			return FRIDAY;
		} else {
			throw new IllegalArgumentException("String does not match any weekday value.");
		}
	}
	
	/**
	 * Returns a short one letter name for the Weekday value
	 * @return The 1-letter name for the given Weekday value
	 */
	public String toShortName() {
		return this.day;
	}
	
	/**
	 * Returns a string representation of the Weekday value
	 */
	public String toString() {
		if (this.day.equals("M")) {
			return "Monday";
		} else if (this.day.equals("T")) {
			return "Tuesday";
		} else if (this.day.equals("W")) {
			return "Wednesday";
		} else if (this.day.equals("R")) {
			return "Thursday";
		} else {
			return "Friday";
		}
	}
}
