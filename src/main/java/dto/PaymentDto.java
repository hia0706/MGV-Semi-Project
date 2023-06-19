package dto;

import java.util.List;

import vo.Payment;

public class PaymentDto {
	
	private int totalRows;
	private List<Payment> payments;
	private Pagination1 pagination;
	
	public PaymentDto() {}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public List<Payment> getPayments() {
		return payments;
	}

	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}

	public Pagination1 getPagination() {
		return pagination;
	}

	public void setPagination(Pagination1 pagination) {
		this.pagination = pagination;
	}
	
	
}
