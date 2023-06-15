package dao;

import java.util.List;

import com.oracle.wls.shaded.org.apache.regexp.recompile;

import util.DaoHelper;
import vo.Oneonone;

public class OneononeDao {

	private static OneononeDao instacne = new OneononeDao();
	private OneononeDao() {}
	public static OneononeDao getInstance() {
		return instacne;
	}
	
	public int getTotalRows() {
		return DaoHelper.selectOne("oneononeDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
	
	public List<Oneonone> getAllOneonones(int begin, int end) {
		return DaoHelper.selectList("oneononeDao.getAllOneonones", rs -> {
			Oneonone oneonone = new Oneonone();
			oneonone.setNo(rs.getInt("oneonone_no"));
			oneonone.setTitle(rs.getString("oneonone_title"));
			oneonone.setContent(rs.getString("oneonone_content"));
			oneonone.setAnswered(rs.getString("oneonone_answered"));
			oneonone.setDeleted(rs.getString("oneonone_deleted"));
			oneonone.setCreateDate(rs.getDate("oneonone_create_date"));
			
			return oneonone;
		}, begin, end);
	}
	
	public void updateOneonone(Oneonone oneonone) {
		DaoHelper.update("oneononeDao.updateOneonone", oneonone.getTitle(),
													   oneonone.getContent(),
													   oneonone.getAnswered(),
													   oneonone.getDeleted(),
													   oneonone.getNo());
	}
	
	public Oneonone getOneononeByNo(int oneononeNo) {
		return DaoHelper.selectOne("oneononeDao.getOneononeByNo", rs -> {
			Oneonone oneonone = new Oneonone();
			oneonone.setNo(rs.getInt("oneonone_no"));
			oneonone.setTitle(rs.getString("oneonone_title"));
			oneonone.setContent(rs.getString("oneonone_content"));
			oneonone.setAnswered(rs.getString("oneonone_answered"));
			oneonone.setDeleted(rs.getString("oneonone_deleted"));
			oneonone.setCreateDate(rs.getDate("oneonone_create_date"));
			
			return oneonone;
			
		}, oneononeNo);
	}
	
	public List<Oneonone> getOneononesById(String memberId) {
		return DaoHelper.selectList("oneononeDao.getOneononesById", rs -> {
			Oneonone oneonone = new Oneonone();
			oneonone.setNo(rs.getInt("oneonone_no"));
			oneonone.setTitle(rs.getString("oneonone_title"));
			oneonone.setContent(rs.getString("oneonone_content"));
			oneonone.setAnswered(rs.getString("oneonone_answered"));
			oneonone.setDeleted(rs.getString("oneonone_deleted"));
			oneonone.setCreateDate(rs.getDate("oneonone_create_date"));
			
			return oneonone;
		}, memberId);
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
