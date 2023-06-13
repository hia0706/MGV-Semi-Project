package dao;

import java.util.List;

import util.DaoHelper;
import vo.FavoriteTheater;
import vo.Member;
import vo.Theater;

public class FavoriteTheaterDao {
	
	private static FavoriteTheaterDao instance = new FavoriteTheaterDao();
	private FavoriteTheaterDao() {}
	public static FavoriteTheaterDao getInstance() {
		return instance;
	}
	
	public List<FavoriteTheater> getFavoriteTheaterById(String memberId) {
		return DaoHelper.selectList("favoriteTheaterDao.getFavoriteTheaterById", rs->{
			FavoriteTheater favoriteTheater = new FavoriteTheater();
			favoriteTheater.setNo(rs.getInt("favorite_no"));
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			favoriteTheater.setMember(member);
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			favoriteTheater.setTheater(theater);
			return favoriteTheater;
		}, memberId);
	}
}
