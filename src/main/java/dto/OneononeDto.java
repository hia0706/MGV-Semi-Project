package dto;

import java.util.List;

import vo.Oneonone;

public class OneononeDto {

	private int totalRows;
	private List<Oneonone> oneononeList;
	private Pagination1 pagination;
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public List<Oneonone> getOneononeList() {
		return oneononeList;
	}
	public void setOneononeList(List<Oneonone> oneononeList) {
		this.oneononeList = oneononeList;
	}
	public Pagination1 getPagination() {
		return pagination;
	}
	public void setPagination(Pagination1 pagination) {
		this.pagination = pagination;
	}
	
}
