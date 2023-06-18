package dao;

import java.util.List;

import util.DaoHelper;
import vo.Faq;
import vo.FaqCategory;
import vo.Member;

public class FaqDao {
	
	private static FaqDao instance = new FaqDao();
	private FaqDao() {}
	public static FaqDao getInstance() {
		return instance;
	}
	
	// total rows
	public int getTotalRows() {
		return DaoHelper.selectOne("faqDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
	
	public int getTotalRowsByCategory(int categoryNo) {
		return DaoHelper.selectOne("faqDao.getTotalRowsByCategory", rs -> {
			return rs.getInt("cnt");
		}, categoryNo);
	}
	
	
	// select
	public List<Faq> getFaq(int begin, int end) {
		return DaoHelper.selectList("faqDao.getFaq", rs -> {
			Faq faq = new Faq();
			faq.setNo(rs.getInt("faq_no"));
			faq.setTitle(rs.getString("faq_title"));
			faq.setContent(rs.getString("faq_content"));
			faq.setDeleted(rs.getString("faq_deleted"));
			faq.setUpdateDate(rs.getDate("faq_update_date"));
			faq.setCreateDate(rs.getDate("faq_create_date")); 
			faq.setMember(new Member(rs.getString("member_id")));
			faq.setFaqCategory(new FaqCategory(rs.getInt("category_no")));
			faq.setFaqCategory(new FaqCategory(rs.getString("category_name")));
			
			return faq;
		}, begin, end);
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
			faq.setMember(new Member(rs.getString("member_id")));
			faq.setFaqCategory(new FaqCategory(rs.getInt("category_no")));
			faq.setFaqCategory(new FaqCategory(rs.getString("category_name")));
			
			return faq;
		}, faqNo);
	}
	
	public List<Faq> getFaqByCategoryNo(int categoryNo, int begin, int end) {
		return DaoHelper.selectList("faqDao.getFaqByCategoryNo", rs -> {
			Faq faq = new Faq();
			faq.setNo(rs.getInt("faq_no"));
			faq.setTitle(rs.getString("faq_title"));
			faq.setContent(rs.getString("faq_content"));
			faq.setDeleted(rs.getString("faq_deleted"));
			faq.setUpdateDate(rs.getDate("faq_update_date"));
			faq.setCreateDate(rs.getDate("faq_create_date"));
			faq.setMember(new Member(rs.getString("member_id")));
			faq.setFaqCategory(new FaqCategory(rs.getInt("category_no")));
			faq.setFaqCategory(new FaqCategory(rs.getString("category_name")));
			
			return faq;
		}, categoryNo, begin, end);
	}

	
	// insert, update
	public void insertFaq(Faq faq) {
		DaoHelper.update("faqDao.insertFaq", faq.getTitle(),
											faq.getContent(),
											faq.getMember().getId(),
											faq.getFaqCategory().getNo());
	}
	
	public void updateFaq(Faq faq) {
		DaoHelper.update("faqDao.updateFaq", faq.getTitle(),
											faq.getContent(),
											faq.getDeleted(),
											faq.getFaqCategory().getNo(),
											faq.getNo());
								}
	
}
