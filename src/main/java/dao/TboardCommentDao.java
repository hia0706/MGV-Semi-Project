package dao;

import util.DaoHelper;
import vo.TboardComment;

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
}
