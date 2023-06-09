package dao;

import java.util.List;

import util.DaoHelper;
import vo.Location;
import vo.Theater;

public class TheaterDao {
	
	private static TheaterDao instance = new TheaterDao();
	private TheaterDao() {}
	public static TheaterDao getInstance() {
		return instance;
	}
	
	public List<Theater> getAllTheaters(){
		return DaoHelper.selectList("theaterDao.getAllTheaters", rs->{
			Theater theater = new Theater();
				theater.setNo(rs.getInt("theater_no"));
				theater.setName(rs.getString("theater_name"));
				theater.setAddress1(rs.getString("theater_address1"));
				theater.setAddress2(rs.getString("theater_address2"));
				theater.setDisable(rs.getString("theater.disable"));
				theater.setTel(rs.getString("theater_tel"));
				Location location = new Location();
				location.setNo(rs.getInt("location_no"));
				theater.setLocation(location);
			return theater;
		});
	}
}
