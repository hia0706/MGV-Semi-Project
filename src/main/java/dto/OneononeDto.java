package dto;

import java.util.List;

import vo.Oneonone;

public class OneononeDto {

	private int totalRows;
	private List<Oneonone> oneononeList;
	private Pagination pagination;
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
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
}
