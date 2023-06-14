package dao;

import java.util.List;

import org.apache.catalina.core.FrameworkListener;

import util.DaoHelper;
import vo.Lostitem;
import vo.Member;

public class LostitemDao {
	
	private static LostitemDao instance = new LostitemDao();
	private LostitemDao() {}
	public static LostitemDao getInstance() {
		return instance;
	}
	
	public void updateLostitem(Lostitem lostitem) {
		DaoHelper.update("lostitemDao.updateLostitem", lostitem.getTitle(),
													   lostitem.getContent(),
													   lostitem.getAnswered(),
													   lostitem.getDeleted(),
													   lostitem.getNo());
	}
	
	public  Lostitem getLostitemByNo(int LostitemNo) {
		return DaoHelper.selectOne("lostitemDao.getLostitemByNo", rs -> {
			Lostitem lostitem = new Lostitem();
			lostitem.setNo(rs.getInt("lostitem_no"));
			lostitem.setTitle(rs.getString("lostitem_title"));
			lostitem.setContent(rs.getString("lostitem_content"));
			lostitem.setAnswered(rs.getString("lostitem_answered"));
			lostitem.setDeleted(rs.getString("lostitem_deleted"));
			lostitem.setCreateDate(rs.getDate("lostitem_create_date"));
			lostitem.setMember(new Member(rs.getString("member_id")));
			
			return lostitem;
		}, LostitemNo);
	}
	
	public List<Lostitem> getLostitems() {
		return DaoHelper.selectList("lostitemDao.getLostitems", rs -> {
			Lostitem lostitem = new Lostitem();
			lostitem.setNo(rs.getInt("lostitem_no"));
			lostitem.setTitle(rs.getString("lostitem_title"));
			lostitem.setContent(rs.getString("lostitem_content"));
			lostitem.setAnswered(rs.getString("lostitem_answered"));
			lostitem.setDeleted(rs.getString("lostitem_deleted"));
			lostitem.setCreateDate(rs.getDate("lostitem_create_date"));
			
			return lostitem;
		});
	}

	public void insertLostitem(Lostitem lostitem) {
		DaoHelper.update("lostitemDao.insertLostitem", lostitem.getTitle(),
													   lostitem.getContent(),
													   lostitem.getMember().getId(),
													   lostitem.getMember().getEmail(),
													   lostitem.getMember().getTel(),
													   lostitem.getMember().getName());
	}
}
