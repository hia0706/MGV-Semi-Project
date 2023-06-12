package dao;

import java.util.List;

import util.DaoHelper;
import vo.ProductCategory;

public class ProductCategoryDao {
	
	private static ProductCategoryDao instance = new ProductCategoryDao();
	private ProductCategoryDao() {}
	public static ProductCategoryDao getInstance() {
		return instance;
	}

	public List<ProductCategory> getCategories() {
		return DaoHelper.selectList("productCategoryDao.getCategories", rs -> {
			ProductCategory cat = new ProductCategory();
			cat.setNo(rs.getInt("cat_no"));
			cat.setName(rs.getString("cat_name"));
			
			return cat;
		});
	}
}
