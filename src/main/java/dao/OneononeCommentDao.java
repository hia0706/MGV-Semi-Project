package dao;

import java.util.List;

import util.DaoHelper;
import vo.Lostitem;
import vo.LostitemComment;
import vo.Member;
import vo.Oneonone;
import vo.OneononeComment;

public class OneononeCommentDao {

	private static OneononeCommentDao instance = new OneononeCommentDao();
	private OneononeCommentDao() {}
	public static OneononeCommentDao getInstance() {
		return instance;
		}
	
	public void insertComment(OneononeComment oneononeComment) {
		DaoHelper.update("oneononeCommentDao.insertComment", oneononeComment.getContent(),
														     oneononeComment.getOneonone().getNo(),
														     oneononeComment.getMember().getId());
	}
	
	public List<OneononeComment> getCommentsByOneononeNo(int oneononeNo) {
		return DaoHelper.selectList("oneononeCommentDao.getCommentsByOneononeNo", rs -> {
			OneononeComment oneononeComment = new OneononeComment();
			oneononeComment.setNo(rs.getInt("comment_no"));
			oneononeComment.setContent(rs.getString("comment_content"));
			oneononeComment.setDeleted(rs.getString("comment_deleted"));
			oneononeComment.setCreateDate(rs.getDate("comment_create_date"));
			oneononeComment.setOneonone(new Oneonone(rs.getInt("oneonone_no")));
			oneononeComment.setMember(new Member(rs.getString("member_id")));
			
			return oneononeComment;
		}, oneononeNo);
	}
	
	public OneononeComment getCommentByNo(int commentNo) {
		return DaoHelper.selectOne("oneononeCommentDao.getCommentByNo", rs -> {
			OneononeComment oneononeComment = new OneononeComment();
			oneononeComment.setNo(rs.getInt("comment_no"));
			oneononeComment.setContent(rs.getString("comment_content"));
			oneononeComment.setDeleted(rs.getString("comment_deleted"));
			oneononeComment.setCreateDate(rs.getDate("comment_create_date"));
			oneononeComment.setOneonone(new Oneonone(rs.getInt("oneonone_no")));
			oneononeComment.setMember(new Member(rs.getString("member_id")));
			
			return oneononeComment;
			
		}, commentNo);
	}
	
	public void updateCommentByNo(OneononeComment oneononeComment) {
		DaoHelper.update("oneononeCommentDao.updateCommentByNo", oneononeComment.getDeleted(),
																 oneononeComment.getNo());
	}
	
	
	}
