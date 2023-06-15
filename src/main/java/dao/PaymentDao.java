package dao;

import java.util.List;

import util.DaoHelper;
import vo.Payment;

public class PaymentDao {

	public static PaymentDao instance = new PaymentDao();
	public PaymentDao() {}
	public static PaymentDao getInstance() {
		return instance;
	}
	
	public Payment getPaymentByNo(int no) {
		return DaoHelper.selectOne("", rs -> {
			Payment payment = new Payment();
			
			return payment;
		}, no);
	}
	
	// 페이징
	public List<Payment> getPayments(int begin, int end) {
		return DaoHelper.selectList("", rs -> {
			Payment payment = new Payment();
			
			
			return payment;
		}, begin, end);
	}
	
	// count
	public int getTotalRows() {
		return DaoHelper.selectOne("paymentDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
	
}
