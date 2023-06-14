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
			favoriteTheater.setCreateDate(rs.getDate("favorite_create_date"));
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
	
	public FavoriteTheater getFavoriteTheaterByKey(String id, int theaterNo) {
		return DaoHelper.selectOne("favoriteTheaterDao.getFavoriteTheaterByKey", rs->{
			FavoriteTheater favoriteTheater = new FavoriteTheater();
			favoriteTheater.setCreateDate(rs.getDate("favorite_create_date"));
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			favoriteTheater.setMember(member);
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			favoriteTheater.setTheater(theater);
			return favoriteTheater;
		}, id,theaterNo);
	}
	
	public void deleteFavoriteTheater(FavoriteTheater favoriteTheater){  
		DaoHelper.update("favoriteTheaterDao.deleteFavoriteTheater", favoriteTheater.getMember().getId(), favoriteTheater.getTheater().getNo());
	};
	public void insertFavoriteTheater(FavoriteTheater favoriteTheater){  
		DaoHelper.update("favoriteTheaterDao.insertFavoriteTheater", favoriteTheater.getMember().getId(), favoriteTheater.getTheater().getNo());
	};	
}
