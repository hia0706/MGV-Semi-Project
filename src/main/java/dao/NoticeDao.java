package dao;

import java.util.List;
import util.DaoHelper;
import vo.Location;
import vo.Member;
import vo.Notice;
import vo.Theater;

public class NoticeDao {
	
	private static NoticeDao instance = new NoticeDao();
	private NoticeDao() {}
	public static NoticeDao getInstance() {
		return instance;
	}
	
	// total rows
	public int getTotalRows() {
		return DaoHelper.selectOne("noticeDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
	
	public int getTotalRowsByTheater(int theaterNo) {
		return DaoHelper.selectOne("noticeDao.getTotalRowsByTheater", rs -> {
			return rs.getInt("cnt");
		}, theaterNo);
	}
	
	public int getTotalRowsByLocation(int locationNo) {
		return DaoHelper.selectOne("noticeDao.getTotalRowsByLocation", rs -> {
			return rs.getInt("cnt");
		}, locationNo);
	}
	
	
	// select
	public List<Notice> getNotice(int begin, int end) {
		return DaoHelper.selectList("noticeDao.getNotice", rs -> {
			Notice notice = new Notice();
			notice.setNo(rs.getInt("notice_no"));
			notice.setTitle(rs.getString("notice_title"));
			notice.setContent(rs.getString("notice_content"));
			notice.setDeleted(rs.getString("notice_deleted"));
			notice.setUpdateDate(rs.getDate("notice_update_date"));
			notice.setCreateDate(rs.getDate("notice_create_date"));
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			notice.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			notice.setLocation(location);
			
			return notice;
		}, begin, end);
	}
	
	public Notice getNoticeByNo(int noticeNo) {
		return DaoHelper.selectOne("noticeDao.getNoticeByNo", rs -> {
			Notice notice = new Notice();
			notice.setNo(rs.getInt("notice_no"));
			notice.setTitle(rs.getString("notice_title"));
			notice.setContent(rs.getString("notice_content"));
			notice.setDeleted(rs.getString("notice_deleted"));
			notice.setUpdateDate(rs.getDate("notice_update_date"));
			notice.setCreateDate(rs.getDate("notice_create_date"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			notice.setMember(member);
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			notice.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			notice.setLocation(location);
			
			return notice;
		}, noticeNo);
	}
	
	public List<Notice> getNoticeByTheaterNo(int theaterNo, int begin, int end) {
		return DaoHelper.selectList("noticeDao.getNoticeByTheaterNo", rs -> {
			Notice notice = new Notice();
			notice.setNo(rs.getInt("notice_no"));
			notice.setTitle(rs.getString("notice_title"));
			notice.setContent(rs.getString("notice_content"));
			notice.setDeleted(rs.getString("notice_deleted"));
			notice.setUpdateDate(rs.getDate("notice_update_date"));
			notice.setCreateDate(rs.getDate("notice_create_date"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			notice.setMember(member);
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			notice.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			notice.setLocation(location);
			
			return notice;
		}, theaterNo, begin, end);
	}
	
	public List<Notice> getNoticeByLocationNo(int locationNo, int begin, int end) {
		return DaoHelper.selectList("noticeDao.getNoticeByLocationNo", rs -> {
			Notice notice = new Notice();
			notice.setNo(rs.getInt("notice_no"));
			notice.setTitle(rs.getString("notice_title"));
			notice.setContent(rs.getString("notice_content"));
			notice.setDeleted(rs.getString("notice_deleted"));
			notice.setUpdateDate(rs.getDate("notice_update_date"));
			notice.setCreateDate(rs.getDate("notice_create_date"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			notice.setMember(member);
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			notice.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			notice.setLocation(location);
			
			return notice;
		}, locationNo, begin, end);
	}
	
	public List<Theater> getTheatersByLocationNo(int locationNo) {
		return DaoHelper.selectList("noticeDao.getTheatersByLocationNo", rs -> {
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			
			return theater;
		}, locationNo);
	}

	
	// insert, update
	public void insertnotice(Notice notice) {
		DaoHelper.update("noticedao.insertnotice", notice.getTitle(),
													notice.getContent(),
													notice.getMember().getId(),
													notice.getTheater().getNo(),
													notice.getLocation().getNo());
	}
	
	public void updatenotice(Notice notice) {
		DaoHelper.update("noticedao.updatenotice", notice.getTitle(),
													notice.getContent(),
													notice.getDeleted(),
													notice.getTheater().getNo(),
													notice.getLocation().getNo(),
													notice.getNo());
	}
}





