package dao;

import java.util.List;

import util.DaoHelper;
import vo.Member;
import vo.TboardComment;
import vo.TheaterBoard;

public class TboardCommentDao {
	
	private static TboardCommentDao instance = new TboardCommentDao();
	private TboardCommentDao() {}
	public static TboardCommentDao getInstance() {
		return instance;
	}
	
	public void insertCommentToTboard(TboardComment tboardComment) {
		DaoHelper.update("tboardCommentDao.insertComment", tboardComment.getContent(),
														   tboardComment.getMember().getId(),
														   tboardComment.getTheaterBoard().getNo());
	}
	
	public void deleteCommentByCommentNo(int commentNo) {
		DaoHelper.update("tboardCommentDao.deleteCommentByCommentNo", commentNo);
	}
	
	
	public TboardComment getCommentByCommentNo(int commentNo) {
		return DaoHelper.selectOne("tboardCommentDao.getCommentByCommentNo", rs -> {
			TboardComment tboardComment = new TboardComment();
			tboardComment.setCommentNo(rs.getInt("comment_no"));
			tboardComment.setContent(rs.getString("comment_content"));
			tboardComment.setCreaeDate(rs.getDate("comment_create_date"));
			tboardComment.setUpdateDate(rs.getDate("comment_update_date"));
			tboardComment.setDeleted(rs.getString("comment_deleted"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			tboardComment.setMember(member);
			
			TheaterBoard theaterBoard = new TheaterBoard();
			theaterBoard.setNo(rs.getInt("board_no"));
			tboardComment.setTheaterBoard(theaterBoard);

			return tboardComment;
		}, commentNo);
	}
	
	
	public List<TboardComment> getCommentByBoardNo(int boardNo) {
		
		return DaoHelper.selectList("tboardCommentDao.getCommentByBoardNo", rs -> {
			TboardComment tboardComment = new TboardComment();
			tboardComment.setCommentNo(rs.getInt("comment_no"));
			tboardComment.setContent(rs.getString("comment_content"));
			tboardComment.setCreaeDate(rs.getDate("comment_create_date"));
			tboardComment.setUpdateDate(rs.getDate("comment_update_date"));
			tboardComment.setDeleted(rs.getString("comment_deleted"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			tboardComment.setMember(member);

			return tboardComment;
		}, boardNo);
	}
	
}
