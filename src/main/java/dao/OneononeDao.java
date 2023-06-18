package dao;

import java.util.List;

import com.oracle.wls.shaded.org.apache.regexp.recompile;

import util.DaoHelper;
import vo.Location;
import vo.Lostitem;
import vo.Member;
import vo.Oneonone;
import vo.Theater;

public class OneononeDao {

	private static OneononeDao instacne = new OneononeDao();
	private OneononeDao() {}
	public static OneononeDao getInstance() {
		return instacne;
	}
	
	// total rows
	public int getTotalRows() {
		return DaoHelper.selectOne("oneononeDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
	
	public int getTotalRowsByTheater(int theaterNo) {
		return DaoHelper.selectOne("oneononeDao.getTotalRowsByTheater", rs -> {
			return rs.getInt("cnt");
		}, theaterNo);
	}
	
	
	// select
	public List<Oneonone> getAllOneonones(int begin, int end) {
		return DaoHelper.selectList("oneononeDao.getAllOneonones", rs -> {
			Oneonone oneonone = new Oneonone();
			oneonone.setNo(rs.getInt("oneonone_no"));
			oneonone.setTitle(rs.getString("oneonone_title"));
			oneonone.setContent(rs.getString("oneonone_content"));
			oneonone.setAnswered(rs.getString("oneonone_answered"));
			oneonone.setDeleted(rs.getString("oneonone_deleted"));
			oneonone.setCreateDate(rs.getDate("oneonone_create_date"));
			oneonone.setMember(new Member(rs.getString("member_id")));
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			oneonone.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			oneonone.setLocation(location);
			
			return oneonone;
		}, begin, end);
	}
	
	public List<Oneonone> getOneononesById(String memberId, int begin, int end) {
		return DaoHelper.selectList("oneononeDao.getOneononesById", rs -> {
			Oneonone oneonone = new Oneonone();
			oneonone.setNo(rs.getInt("oneonone_no"));
			oneonone.setTitle(rs.getString("oneonone_title"));
			oneonone.setContent(rs.getString("oneonone_content"));
			oneonone.setAnswered(rs.getString("oneonone_answered"));
			oneonone.setDeleted(rs.getString("oneonone_deleted"));
			oneonone.setCreateDate(rs.getDate("oneonone_create_date"));
			oneonone.setMember(new Member(rs.getString("member_id")));
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			oneonone.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			oneonone.setLocation(location);
			
			return oneonone;
		}, memberId, begin, end);
	}
	
	public Oneonone getOneononeByNo(int oneononeNo) {
		return DaoHelper.selectOne("oneononeDao.getOneononeByNo", rs -> {
			Oneonone oneonone = new Oneonone();
			oneonone.setNo(rs.getInt("oneonone_no"));
			oneonone.setTitle(rs.getString("oneonone_title"));
			oneonone.setContent(rs.getString("oneonone_content"));
			oneonone.setAnswered(rs.getString("oneonone_answered"));
			oneonone.setDeleted(rs.getString("oneonone_deleted"));
			oneonone.setCreateDate(rs.getDate("oneonone_create_date"));
			oneonone.setMember(new Member(rs.getString("member_id")));
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			oneonone.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			oneonone.setLocation(location);
			
			return oneonone;
			
		}, oneononeNo);
	}
	
	public List<Oneonone> getOneononeByTheaterNo(int oneononeNo, int begin, int end) {
		return DaoHelper.selectList("oneononeDao.getOneononesByTheaterNo", rs -> {
			Oneonone oneonone = new Oneonone();
			oneonone.setNo(rs.getInt("oneonone_no"));
			oneonone.setTitle(rs.getString("oneonone_title"));
			oneonone.setContent(rs.getString("oneonone_content"));
			oneonone.setAnswered(rs.getString("oneonone_answered"));
			oneonone.setDeleted(rs.getString("oneonone_deleted"));
			oneonone.setCreateDate(rs.getDate("oneonone_create_date"));
			oneonone.setMember(new Member(rs.getString("member_id")));
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			oneonone.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			oneonone.setLocation(location);
			
			return oneonone;
		}, oneononeNo, begin, end);
	}
	
	public List<Theater> getTheatersByLocationNo(int locationNo) {
		return DaoHelper.selectList("oneononeDao.getTheatersByLocationNo", rs -> {
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			
			return theater;
		}, locationNo);
	}
	
	
	
	// insert, update
	public void insertOneonOne(Oneonone oneonone) {
		DaoHelper.update("oneononeDao.insertOneonOne", oneonone.getTitle(),
													   oneonone.getContent(),
													   oneonone.getMember().getId(),
													   oneonone.getMember().getEmail(),
													   oneonone.getMember().getTel(),
													   oneonone.getMember().getName(),
													   oneonone.getTheater().getNo(),
													   oneonone.getLocation().getNo());
	}
	
	public void updateOneonone(Oneonone oneonone) {
		DaoHelper.update("oneononeDao.updateOneonone", oneonone.getTitle(),
				oneonone.getContent(),
				oneonone.getAnswered(),
				oneonone.getDeleted(),
				oneonone.getTheater().getNo(),
				oneonone.getLocation().getNo(),
				oneonone.getNo());
	}
}













