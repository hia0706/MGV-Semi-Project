package dto;

import java.util.List;

import vo.Faq;

public class FaqDto {

	private int totalRows;
	private List<Faq> faqList;
	private Pagination1 pagination;
	
	public FaqDto () {}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public List<Faq> getFaqList() {
		return faqList;
	}

	public void setFaqList(List<Faq> faqList) {
		this.faqList = faqList;
	}

	public Pagination1 getPagination() {
		return pagination;
	}

	public void setPagination(Pagination1 pagination) {
		this.pagination = pagination;
	}
	
}
