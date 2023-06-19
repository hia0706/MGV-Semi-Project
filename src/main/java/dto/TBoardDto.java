package dto;

import java.util.List;

import vo.TheaterBoard;

public class TBoardDto {
	private int totalRows;
	private List<TheaterBoard> theaterBoards;
	private Pagination pagination;
	
	public TBoardDto() {}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public List<TheaterBoard> getTheaterBoards() {
		return theaterBoards;
	}

	public void setTheaterBoards(List<TheaterBoard> theaterBoards) {
		this.theaterBoards = theaterBoards;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
}
