package dao;

import util.DaoHelper;
import vo.TheaterBoard;

public class TboardCommentDao {
	
	private static TboardCommentDao instance = new TboardCommentDao();
	private TboardCommentDao() {}
	public static TboardCommentDao getInstance() {
		return instance;
	}
	
	public void insertCommentToTboard(TheaterBoard theaterBoard) {
		DaoHelper.update("tboardCommentDao.insertComment", theaterBoard.getContent(),
														   theaterBoard.getMember().getId(),
														   theaterBoard.getNo());
	}
}
