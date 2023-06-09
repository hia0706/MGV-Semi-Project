package dao;

import java.util.List;

import util.DaoHelper;
import vo.Location;

public class LocationDao {
	
	private static LocationDao instance = new LocationDao();
	private LocationDao() {}
	public static LocationDao getInstance() {
		return instance;
	}

	public List<Location> getLocations() {
		return DaoHelper.selectList("locationDao.getLocations", rs -> {
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			
			return location;
		});
		
	}
}
