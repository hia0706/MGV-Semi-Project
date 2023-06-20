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
			schedule.setOpenDate(rs.getDate("schedule_open_date"));
			schedule.setTimeNo(rs.getInt("schedule_time_no"));
			return schedule;
		},inputDate,movieNo);
	
		
	}
	public void clearDailySchedules(String inputDate, int movieNo) {
		DaoHelper.update("scheduleDao.clearDailySchedules", inputDate, movieNo);
	}
	public void insertSchedule(Schedule schedule) {
		DaoHelper.update("scheduleDao.insertSchedule", schedule.getKey(),
														schedule.getOpenDate(),
														schedule.getTimeNo(),
														schedule.getMovieNo(),
														schedule.getTheaterNo());		
	}
	
	
}
