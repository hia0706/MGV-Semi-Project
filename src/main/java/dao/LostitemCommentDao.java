package dao;

import java.util.List;

import util.DaoHelper;
import vo.Lostitem;
import vo.LostitemComment;
import vo.Member;

public class LostitemCommentDao {
	
	private static LostitemCommentDao instance = new LostitemCommentDao();
	private LostitemCommentDao() {}
	public static LostitemCommentDao getInstance() {
		return instance;
	}

	public void insertComment(LostitemComment lostitemComment) {
		DaoHelper.update("lostitemCommentDao.insertComment", lostitemComment.getContent(),
															 lostitemComment.getLostitem().getNo(),
															 lostitemComment.getMember().getId());
	}
	
	public List<LostitemComment> getCommentsByLostitemNo(int lostitemNo) {
		return DaoHelper.selectList("lostitemCommentDao.getCommentsByLostitemNo", rs -> {
			LostitemComment lostitemComment = new LostitemComment();
			lostitemComment.setNo(rs.getInt("comment_no"));
			lostitemComment.setContent(rs.getString("comment_content"));
			lostitemComment.setDeleted(rs.getString("comment_deleted"));
			lostitemComment.setCreateDate(rs.getDate("comment_createdate"));
			lostitemComment.setLostitem(new Lostitem(rs.getInt("lostitem_no")));
			lostitemComment.setMember(new Member(rs.getString("member_id")));
			
			return lostitemComment;
		}, lostitemNo); 
	}
	
	public LostitemComment getCommentByNo(int commentNo) {
		return DaoHelper.selectOne("lostitemCommentDao.getCommentByNo", rs -> {
			LostitemComment lostitemComment = new LostitemComment();
			lostitemComment.setNo(rs.getInt("comment_no"));
			lostitemComment.setContent(rs.getString("comment_content"));
			lostitemComment.setDeleted(rs.getString("comment_deleted"));
			lostitemComment.setCreateDate(rs.getDate("comment_createdate"));
			lostitemComment.setLostitem(new Lostitem(rs.getInt("lostitem_no")));
			lostitemComment.setMember(new Member(rs.getString("member_id")));
			
			return lostitemComment;
			
		}, commentNo);
	}
	
	public void updateCommentByNo(LostitemComment lostitemComment) {
		DaoHelper.update("lostitemCommentDao.updateCommentByNo", lostitemComment.getDeleted(),
																 lostitemComment.getNo());
	}
	
	
	
	
	
	
	
	
	
	
}
