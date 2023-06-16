package dao;

import java.util.List;

import util.DaoHelper;
import vo.Member;
import vo.Payment;
import vo.Product;

public class PaymentDao {

	public static PaymentDao instance = new PaymentDao();
	public PaymentDao() {}
	public static PaymentDao getInstance() {
		return instance;
	}

	// 로그인아이디 행의 개수
	public int getTotalRowsById(String id) {
		return DaoHelper.selectOne("paymentDao.getTotalRowsById", rs -> {
			return rs.getInt("cnt");
		}, id);
	}
	
	// 로그인 아이디의 Status = ? 행의 개수
	public int getTotalRowsByIdandStatus(String id, String status) {
		return DaoHelper.selectOne("paymentDao.getTotalRowsByIdByStatus", rs -> {
			return rs.getInt("cnt");
		}, id, status);
	}
	
	// select
	public List<Payment> getAllPaymentsById(String id, int begin, int end) {
		return DaoHelper.selectList("paymentDao.getAllPaymentsById", rs -> {
			Payment payment = new Payment();
			payment.setNo(rs.getInt("payment_no"));
			payment.setCreateDate(rs.getDate("payment_create_date"));
			payment.setUpdateDate(rs.getDate("payment_update_date"));
			payment.setStatus(rs.getString("payment_status"));
			payment.setPrice(rs.getInt("payment_price"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			payment.setMember(member);
			
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			payment.setProduct(product);
			
			return payment;
		}, id , begin, end);
	}
	
	public List<Payment> getPaymentsByIdandStatus(String id, String status, int begin, int end) {
		return DaoHelper.selectList("paymentDao.getPaymentsByIdandStatus", rs -> {
			Payment payment = new Payment();
			payment.setNo(rs.getInt("payment_no"));
			payment.setCreateDate(rs.getDate("payment_create_date"));
			payment.setUpdateDate(rs.getDate("payment_update_date"));
			payment.setStatus(rs.getString("payment_status"));
			payment.setPrice(rs.getInt("payment_price"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			payment.setMember(member);
			
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			payment.setProduct(product);
			
			return payment;
		}, id, status, begin, end);
	}
	
	
}
