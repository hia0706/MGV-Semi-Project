package dao;

import java.util.List;

import util.DaoHelper;
import vo.Member;
import vo.SboardComment;
import vo.StoreBoard;

public class SboardCommentDao {
	
	private static SboardCommentDao instance = new SboardCommentDao();
	private SboardCommentDao() {}
	public static SboardCommentDao getInstance() {
		return instance;
	}
	
	public void insertCommentToSboard(SboardComment sboardComment) {
		DaoHelper.update("sboardCommentDao.insertComment", sboardComment.getContent(),
														   sboardComment.getMember().getId(),
														   sboardComment.getStoreBoard().getNo());
	}
	
	public void deleteCommentByCommentNo(int commentNo) {
		DaoHelper.update("sboardCommentDao.deleteCommentByCommentNo", commentNo);
	}
	
	
	public SboardComment getCommentByCommentNo(int commentNo) {
		return DaoHelper.selectOne("sboardCommentDao.getCommentByCommentNo", rs -> {
			
			SboardComment sboardComment = new SboardComment();
			sboardComment.setCommentNo(rs.getInt("comment_no"));
			sboardComment.setContent(rs.getString("comment_content"));
			sboardComment.setCreaeDate(rs.getDate("comment_create_date"));
			sboardComment.setUpdateDate(rs.getDate("comment_update_date"));
			sboardComment.setDeleted(rs.getString("comment_deleted"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			sboardComment.setMember(member);
			
			StoreBoard storeBoard = new StoreBoard();
			storeBoard.setNo(rs.getInt("board_no"));
			sboardComment.setStoreBoard(storeBoard);

			return sboardComment;
		}, commentNo);
	}
	
	
	public List<SboardComment> getCommentByBoardNo(int boardNo) {
		
		return DaoHelper.selectList("sboardCommentDao.getCommentByBoardNo", rs -> {
			SboardComment sboardComment = new SboardComment();
			sboardComment.setCommentNo(rs.getInt("comment_no"));
			sboardComment.setContent(rs.getString("comment_content"));
			sboardComment.setCreaeDate(rs.getDate("comment_create_date"));
			sboardComment.setUpdateDate(rs.getDate("comment_update_date"));
			sboardComment.setDeleted(rs.getString("comment_deleted"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			sboardComment.setMember(member);

			return sboardComment;
		}, boardNo);
	}
}
