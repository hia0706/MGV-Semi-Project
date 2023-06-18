package dao;

import java.util.List;

import org.apache.catalina.core.FrameworkListener;

import util.DaoHelper;
import vo.Location;
import vo.Lostitem;
import vo.Member;
import vo.Theater;

public class LostitemDao {
	
	private static LostitemDao instance = new LostitemDao();
	private LostitemDao() {}
	public static LostitemDao getInstance() {
		return instance;
	}
	
	// total rows
	public int getTotalRows() {
		return DaoHelper.selectOne("lostitemDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
	
	public int getTotalRowsByTheater(int theaterNo) {
		return DaoHelper.selectOne("lostitemDao.getTotalRowsByTheater", rs -> {
			return rs.getInt("cnt");
		}, theaterNo);
	}
	
	
	// select
	public List<Lostitem> getLostitems(int begin, int end) {
		return DaoHelper.selectList("lostitemDao.getLostitems", rs -> {
			Lostitem lostitem = new Lostitem();
			lostitem.setNo(rs.getInt("lostitem_no"));
			lostitem.setTitle(rs.getString("lostitem_title"));
			lostitem.setContent(rs.getString("lostitem_content"));
			lostitem.setAnswered(rs.getString("lostitem_answered"));
			lostitem.setDeleted(rs.getString("lostitem_deleted"));
			lostitem.setCreateDate(rs.getDate("lostitem_create_date"));
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			lostitem.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			lostitem.setLocation(location);
			
			return lostitem;
		}, begin, end);
	}
	
	public  Lostitem getLostitemByNo(int LostitemNo) {
		return DaoHelper.selectOne("lostitemDao.getLostitemByNo", rs -> {
			Lostitem lostitem = new Lostitem();
			lostitem.setNo(rs.getInt("lostitem_no"));
			lostitem.setTitle(rs.getString("lostitem_title"));
			lostitem.setContent(rs.getString("lostitem_content"));
			lostitem.setAnswered(rs.getString("lostitem_answered"));
			lostitem.setDeleted(rs.getString("lostitem_deleted"));
			lostitem.setCreateDate(rs.getDate("lostitem_create_date"));
			lostitem.setMember(new Member(rs.getString("member_id")));
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			lostitem.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			lostitem.setLocation(location);
			
			return lostitem;
		}, LostitemNo);
	}
	
	public List<Lostitem> getLostitemByTheaterNo(int LostitemNo, int begin, int end) {
		return DaoHelper.selectList("lostitemDao.getLostitemByTheaterNo", rs -> {
			Lostitem lostitem = new Lostitem();
			lostitem.setNo(rs.getInt("lostitem_no"));
			lostitem.setTitle(rs.getString("lostitem_title"));
			lostitem.setContent(rs.getString("lostitem_content"));
			lostitem.setAnswered(rs.getString("lostitem_answered"));
			lostitem.setDeleted(rs.getString("lostitem_deleted"));
			lostitem.setCreateDate(rs.getDate("lostitem_create_date"));
			lostitem.setMember(new Member(rs.getString("member_id")));
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			lostitem.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			lostitem.setLocation(location);
			
			return lostitem;
		}, LostitemNo, begin, end);
	}
	
	public List<Theater> getTheatersByLocationNo(int locationNo) {
		return DaoHelper.selectList("lostitemDao.getTheatersByLocationNo", rs -> {
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			
			return theater;
		}, locationNo);
	}
	
	
	// insert, update
	public void insertLostitem(Lostitem lostitem) {
		DaoHelper.update("lostitemDao.insertLostitem", lostitem.getTitle(),
				lostitem.getContent(),
				lostitem.getMember().getId(),
				lostitem.getMember().getEmail(),
				lostitem.getMember().getTel(),
				lostitem.getMember().getName(),
				lostitem.getTheater().getNo(),
				lostitem.getLocation().getNo());
	}
	
	public void updateLostitem(Lostitem lostitem) {
		DaoHelper.update("lostitemDao.updateLostitem", lostitem.getTitle(),
				lostitem.getContent(),
				lostitem.getAnswered(),
				lostitem.getDeleted(),
				lostitem.getTheater().getNo(),
				lostitem.getLocation().getNo(),
				lostitem.getNo());
	}
}

















