package dto;

import java.util.List;

import vo.StoreBoard;

public class SBoardDto {
	private int totalRows;
	private List<StoreBoard> storeBoards;
	private Pagination pagination;
	
	public SBoardDto() {}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public List<StoreBoard> getStoreBoards() {
		return storeBoards;
	}
	
	public void setStoreBoards(List<StoreBoard> storeBoards) {
		this.storeBoards = storeBoards;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
}
