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
				theater.setAddress(rs.getString("theater_address"));
				theater.setDisabled(rs.getString("theater_disabled"));
				theater.setTel(rs.getString("theater_tel"));
				Location location = new Location();
				location.setNo(rs.getInt("location_no"));
				theater.setLocation(location);
			return theater;
		});
	}
	public List<Theater> getTheatersByLocNo(int locationNo){
		return DaoHelper.selectList("theaterDao.getTheatersByLocNo", rs->{
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			theater.setAddress(rs.getString("theater_address"));
			theater.setDisabled(rs.getString("theater_disabled"));
			theater.setTel(rs.getString("theater_tel"));
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			theater.setLocation(location);
			return theater;
		},locationNo);
	}
	
	public Theater getTheaterByNo(int theaterNo) {
		return DaoHelper.selectOne("theaterDao.getTheaterByNo", rs->{
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			theater.setAddress(rs.getString("theater_address"));
			theater.setDisabled(rs.getString("theater_disabled"));
			theater.setTel(rs.getString("theater_tel"));
			theater.setParkingInfo(rs.getString("theater_parking_info"));
			theater.setParkingFee(rs.getString("theater_parking_fee"));
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			theater.setLocation(location);
			return theater;
		}, theaterNo);
	}
	public List<Theater> getAllTheatersWithLocationName(){
		return DaoHelper.selectList("theaterDao.getAllTheatersWithLocationName", rs->{
			Theater theater = new Theater();
				theater.setNo(rs.getInt("theater_no"));
				theater.setName(rs.getString("theater_name"));
				theater.setAddress(rs.getString("theater_address"));
				theater.setDisabled(rs.getString("theater_disabled"));
				theater.setTel(rs.getString("theater_tel"));
				Location location = new Location();
				location.setNo(rs.getInt("location_no"));
				location.setName(rs.getString("location_name"));
				theater.setLocation(location);
			return theater;
		});
	}
}
