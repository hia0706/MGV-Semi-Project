package dao;

import java.util.List;

import util.DaoHelper;
import vo.MboardComment;
import vo.Member;
import vo.MovieBoard;

public class MboardCommentDao {
	
	private static MboardCommentDao instance = new MboardCommentDao();
	private MboardCommentDao() {}
	public static MboardCommentDao getInstance() {
		return instance;
	}
	
	public void insertCommentToMboard(MboardComment mboardComment) {
		DaoHelper.update("mboardCommentDao.insertComment", mboardComment.getContent(),
														   mboardComment.getMember().getId(),
														   mboardComment.getMovieBoard().getNo());
	}
	
	public void deleteCommentByCommentNo(int commentNo) {
		DaoHelper.update("mboardCommentDao.deleteCommentByCommentNo", commentNo);
	}
	
	
	public MboardComment getCommentByCommentNo(int commentNo) {
		return DaoHelper.selectOne("mboardCommentDao.getCommentByCommentNo", rs -> {
			
			MboardComment mboardComment = new MboardComment();
			mboardComment.setCommentNo(rs.getInt("comment_no"));
			mboardComment.setContent(rs.getString("comment_content"));
			mboardComment.setCreaeDate(rs.getDate("comment_create_date"));
			mboardComment.setUpdateDate(rs.getDate("comment_update_date"));
			mboardComment.setDeleted(rs.getString("comment_deleted"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			mboardComment.setMember(member);
			
			MovieBoard movieBoard = new MovieBoard();
			movieBoard.setNo(rs.getInt("board_no"));
			mboardComment.setMovieBoard(movieBoard);

			return mboardComment;
		}, commentNo);
	}
	
	
	public List<MboardComment> getCommentByBoardNo(int boardNo) {
		
		return DaoHelper.selectList("mboardCommentDao.getCommentByBoardNo", rs -> {
			MboardComment mboardComment = new MboardComment();
			mboardComment.setCommentNo(rs.getInt("comment_no"));
			mboardComment.setContent(rs.getString("comment_content"));
			mboardComment.setCreaeDate(rs.getDate("comment_create_date"));
			mboardComment.setUpdateDate(rs.getDate("comment_update_date"));
			mboardComment.setDeleted(rs.getString("comment_deleted"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			mboardComment.setMember(member);

			return mboardComment;
		}, boardNo);
	}
}
