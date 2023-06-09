package dao;

import util.DaoHelper;
import vo.Product;

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
}
