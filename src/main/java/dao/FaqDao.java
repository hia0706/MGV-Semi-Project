package dao;

import java.util.List;

import util.DaoHelper;
import vo.Faq;

public class FaqDao {
	
	private static FaqDao instance = new FaqDao();
	private FaqDao() {}
	public static FaqDao getInstance() {
		return instance;
	}
	
	
	public void updateFaq(Faq faq) {
		DaoHelper.update("faqDao.updateFaq", faq.getTitle(),
											 faq.getContent(),
											 faq.getDeleted(),
											 faq.getNo());
	}
	
	public void insertFaq(Faq faq) {
		DaoHelper.update("faqDao.insertFaq", faq.getTitle(),
											 faq.getContent(),
											 faq.getMember().getId());
	}
	
	public Faq getFaqByNo(int faqNo) {
		return DaoHelper.selectOne("faqDao.getFaqByNo", rs -> {
			Faq faq = new Faq();
			faq.setNo(rs.getInt("faq_no"));
			faq.setTitle(rs.getString("faq_title"));
			faq.setContent(rs.getString("faq_content"));
			faq.setDeleted(rs.getString("faq_deleted"));
			faq.setUpdateDate(rs.getDate("faq_update_date"));
			faq.setCreateDate(rs.getDate("faq_create_date")); 
			
			return faq;
		}, faqNo);
	}

	public List<Faq> getFaq(int begin, int end) {
		return DaoHelper.selectList("faqDao.getFaq", rs -> {
			Faq faq = new Faq();
			faq.setNo(rs.getInt("faq_no"));
			faq.setTitle(rs.getString("faq_title"));
			faq.setContent(rs.getString("faq_content"));
			faq.setDeleted(rs.getString("faq_deleted"));
			faq.setUpdateDate(rs.getDate("faq_update_date"));
			faq.setCreateDate(rs.getDate("faq_create_date")); 
			
			return faq;
		}, begin, end);
	}
	
	public int getTotalRows() {
		return DaoHelper.selectOne("faqDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
}
