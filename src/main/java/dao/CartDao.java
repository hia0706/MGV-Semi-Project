package dao;

import java.util.List;

import util.DaoHelper;
import vo.Cart;
import vo.Member;
import vo.Product;

public class CartDao {

	private static CartDao instance = new CartDao();
	private CartDao() {}
	public static CartDao getInstance() {
		return instance;
	}
	
	public void insertCart(Cart cart) {
		DaoHelper.update("cartDao.insertCart", cart.getMember().getId(),
											   cart.getProduct().getNo(),
											   cart.getAmount(),
											   cart.getTotalPrice());
	}
	
	public List<Cart> getMyCarts(String id) {
		return DaoHelper.selectList("cartDao.getMyCarts", rs -> {
			Cart cart = new Cart();
			cart.setNo(rs.getInt("cart_no"));
			cart.setAmount(rs.getInt("cart_amount"));
			cart.setTotalPrice(rs.getInt("cart_totalprice"));
			cart.setCreateDate(rs.getDate("cart_create_date"));
			cart.setUpdateDate(rs.getDate("cart_update_date"));
			cart.setStatus(rs.getString("cart_status"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			cart.setMember(member);
			
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("product_price"));
			cart.setProduct(product);
			
			return cart;
		}, id);
	}
	
	public void updateCart(String id) {
		DaoHelper.update("cartDao.updateCart", id);
	}
	
	public void deleteCartItem(int no) {
		DaoHelper.update("cartDao.deleteCartItem", no);
	}
}











