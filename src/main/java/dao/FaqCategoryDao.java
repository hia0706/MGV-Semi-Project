package dao;

import java.util.List;

import util.DaoHelper;
import vo.FaqCategory;

public class FaqCategoryDao {

	private static FaqCategoryDao instance = new FaqCategoryDao();
	private FaqCategoryDao() {}
	public static FaqCategoryDao getInstance() {
		return instance;
	} 
	
	
	public List<FaqCategory> getAllFaqCategories() {
		return DaoHelper.selectList("faqCategoryDao.getAllFaqCategories", rs -> {
			FaqCategory faqCategory = new FaqCategory();
			faqCategory.setNo(rs.getInt("category_no"));
			faqCategory.setName(rs.getString("category_name"));
			
			return faqCategory;
		});
	}
	
	public FaqCategory getFaqCategoryByNo(int categoryNo) {
		return DaoHelper.selectOne("faqCategoryDao.getFaqCategoryByNo", rs -> {
			FaqCategory faqCategory = new FaqCategory();
			faqCategory.setNo(rs.getInt("category_no"));
			faqCategory.setName(rs.getString("category_name"));
			
			return faqCategory;
		}, categoryNo);
	}
}
