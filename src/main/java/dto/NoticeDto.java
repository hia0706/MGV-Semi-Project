package dto;

import java.util.List;

import vo.Notice;

public class NoticeDto {

	private int totalRows;
	private List<Notice> noticeList;
	private Pagination1 pagination;
	
	public NoticeDto() {}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public List<Notice> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(List<Notice> noticeList) {
		this.noticeList = noticeList;
	}

	public Pagination1 getPagination() {
		return pagination;
	}

	public void setPagination(Pagination1 pagination) {
		this.pagination = pagination;
	}
	
}
