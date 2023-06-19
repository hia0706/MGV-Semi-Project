package vo;

import java.util.Date;

public class Schedule {

	private String key;
	private int movieNo;
	private int theaterNo;
	private int timeNo;
	private Date scheduleDate;
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public int getTheaterNo() {
		return theaterNo;
	}
	public void setTheaterNo(int theaterNo) {
		this.theaterNo = theaterNo;
	}
	public int getTimeNo() {
		return timeNo;
	}
	public void setTimeNo(int timeNo) {
		this.timeNo = timeNo;
	}
	public Date getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
}
