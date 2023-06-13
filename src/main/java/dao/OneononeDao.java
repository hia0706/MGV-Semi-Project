package dao;

import util.DaoHelper;
import vo.Oneonone;

public class OneononeDao {

	private static OneononeDao instacne = new OneononeDao();
	private OneononeDao() {}
	public static OneononeDao getInstance() {
		return instacne;
	}
	
	public void insertOneonOne(Oneonone oneonone) {
		DaoHelper.update("oneononeDao.insertOneonOne", oneonone.getTitle(),
													   oneonone.getContent(),
													   oneonone.getMember().getId(),
													   oneonone.getMember().getEmail(),
													   oneonone.getMember().getTel(),
													   oneonone.getMember().getName());
	}
}
