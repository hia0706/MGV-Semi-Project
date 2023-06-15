package dao;

import java.util.List;
import util.DaoHelper;
import vo.Notice;

public class NoticeDao {
	
	private static NoticeDao instance = new NoticeDao();
	private NoticeDao() {}
	public static NoticeDao getInstance() {
		return instance;
	}
	
	public void updatenotice(Notice notice) {
		DaoHelper.update("noticedao.updatenotice", notice.getTitle(),
													 notice.getContent(),
												  	 notice.getDeleted(),
													 notice.getNo());
	}
	
	public void insertnotice(Notice notice) {
		DaoHelper.update("noticedao.insertnotice", notice.getTitle(),
													 notice.getContent(),
													 notice.getMember().getId());
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
			
			return notice;
		}, noticeNo);
	}
	
	public List<Notice> getNotice(int begin, int end) {
		return DaoHelper.selectList("noticeDao.getNotice", rs -> {
			Notice notice = new Notice();
			notice.setNo(rs.getInt("notice_no"));
			notice.setTitle(rs.getString("notice_title"));
			notice.setContent(rs.getString("notice_content"));
			notice.setDeleted(rs.getString("notice_deleted"));
			notice.setUpdateDate(rs.getDate("notice_update_date"));
			notice.setCreateDate(rs.getDate("notice_create_date"));
			
			return notice;
		}, begin, end);
	}
	
	public int getTotalRows() {
		return DaoHelper.selectOne("noticeDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}

}











