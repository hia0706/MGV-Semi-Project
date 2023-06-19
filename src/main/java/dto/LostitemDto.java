package dto;

import java.util.List;

import vo.Location;
import vo.Lostitem;
import vo.Notice;

public class LostitemDto {

	private int totalRows;
	private List<Lostitem> lostimeList;
	private Pagination pagination;
	
	public LostitemDto() {}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public List<Lostitem> getLostimeList() {
		return lostimeList;
	}

	public void setLostimeList(List<Lostitem> lostimeList) {
		this.lostimeList = lostimeList;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	
}
