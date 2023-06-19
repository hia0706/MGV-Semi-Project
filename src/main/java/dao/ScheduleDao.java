package dao;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import util.DaoHelper;
import util.DateUtils;
import vo.Schedule;

public class ScheduleDao {
	private static ScheduleDao instance = new ScheduleDao();
	private ScheduleDao() {}
	public static ScheduleDao getInstance() {
		return instance;
	}
	
	
	public List<Schedule> getSchedules(String inputDate, int movieNo){
		return DaoHelper.selectList("scheduleDao.getSchedules", rs->{
			Schedule schedule = new Schedule();
			schedule.setKey(rs.getString("schedule_key"));
			schedule.setMovieNo(rs.getInt("movie_no"));
			schedule.setTheaterNo(rs.getInt("theater_no"));
			schedule.setScheduleDate(rs.getDate("schedule_open_date"));
			schedule.setTimeNo(rs.getInt("schedule_time_no"));
			return schedule;
		},inputDate,movieNo);
	
		
	}
	public List<Schedule> getSchedulesByDate(Date inputDate){
		String date=DateUtils.toText(inputDate);
		return DaoHelper.selectList("scheduleDao.getSchedulesByDate",rs -> {
			Schedule schedule = new Schedule();
			schedule.setMovieNo(rs.getInt("movie_no"));
			schedule.setTheaterNo(rs.getInt("theater_no"));
			schedule.setScheduleDate(rs.getDate("schedule_open_date"));
			schedule.setTimeNo(rs.getInt("schedule_time_no"));
			
			return schedule;
		}, date);
	}
	
	public HashMap<Integer,List<Schedule>> getDailySchedules(String inputDate, int movieNo,HashSet<Integer> theaterNos){
		HashMap<Integer,List<Schedule>> schedules= new HashMap<>();
		for (int theaterNo : theaterNos) {
			schedules.put(theaterNo, DaoHelper.selectList("scheduleDao.getDailySchedules",rs -> {
				Schedule schedule = new Schedule();
				schedule.setKey(rs.getString("schedule_key"));
				schedule.setMovieNo(rs.getInt("movie_no"));
				schedule.setTheaterNo(rs.getInt("theater_no"));
				schedule.setScheduleDate(rs.getDate("schedule_open_date"));
				schedule.setTimeNo(rs.getInt("schedule_time_no"));
				
				return schedule;
			}, inputDate,movieNo,theaterNo));
		}
		return schedules;
	}
}
