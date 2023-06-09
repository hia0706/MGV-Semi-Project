package dao;

import java.util.List;

import util.DaoHelper;
import vo.Product;
import vo.ProductCategory;

public class ProductDao {
	
	private static ProductDao instance = new ProductDao();
	private ProductDao() {}
	public static ProductDao getInstance() {
		return instance;
	}

	public void insertProduct(Product product) {
		DaoHelper.update("productDao.insertProduct", product.getName(),
													 product.getPrice(),
													 product.getStock(),
													 product.getDescription(),
													 product.getProductCategory().getNo());
	}
	
	public Product getProductByName(String name) {
		return DaoHelper.selectOne("", rs -> {
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("product_price"));
			product.setStock(rs.getInt("product_stock"));
			product.setCreateDate(rs.getDate("product_create_date"));
			product.setUpdateDate(rs.getDate("product_update_date"));
			product.setSoldOut(rs.getString("product_sold_out"));
			product.setDescription(rs.getString("product_description"));
			
			ProductCategory cat = new ProductCategory();
			cat.setNo(rs.getInt("cat_no"));
			product.setProductCategory(cat);
			
			return product;
		}, name);
	}
	
	public List<Product> getProducts(int begin, int end) {
		return DaoHelper.selectList("", rs -> {
			Product product = new Product();
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("product_price"));
			product.setStock(rs.getInt("product_stock"));
			product.setDescription(rs.getString("product_description"));
			
			ProductCategory cat = new ProductCategory();
			cat.setNo(rs.getInt("cat_no"));
			product.setProductCategory(cat);
			
			return product;
		}, begin, end);
	}
}
