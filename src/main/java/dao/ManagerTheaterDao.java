package dao;

import java.util.List;

import util.DaoHelper;
import vo.Location;
import vo.Theater;

public class ManagerTheaterDao {

	public List<Theater> getAllTheaters (int begin, int end){
		return DaoHelper.selectList("managerTheaterDao.selectTeater", rs-> {
			Theater theater = new Theater();
			
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			theater.setAddress(rs.getString("theater_address"));
			theater.setTel(rs.getString("theater_tel"));
			theater.setDisabled(rs.getString("theater_disabled"));
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			theater.setLocation(location);
			
			return theater;
		}, begin, end);
	}
	
	public int getTotalRows (String disable) {
		
		return DaoHelper.selectOne("managerTheaterDao.getTotalRowsByDisabled", rs -> {
			return rs.getInt("cnt");
		}, disable);
	}
	
	public void insertTheater(Theater theater) {
		DaoHelper.update("managerTheaterDao.insertTheater", theater.getNo(),
															theater.getLocation().getNo(),
															theater.getName(),
															theater.getAddress(),
															theater.getTel());
	}
}
