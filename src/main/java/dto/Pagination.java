package dto;

public class Pagination {

	private int page;			// 요청한 페이지 번호
	private int rows = 10;		// 한 화면에 표시할 행의 갯수
	private int pages = 5;		// 한 화면에 표시할 페이지번호 갯수
	private int totalRows;		// 전체 데이터 갯수
	private int pageNo;
	private int beginPage;
	private int endPage;
	
	public int getbeginPage() {
		return beginPage;
	}
	
	public void setbeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	
	public int getendPage() {
		return endPage;
	}
	
	public void setendPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public Pagination(int page, int totalRows) {
		this.page = page;
		this.totalRows = totalRows;
	}
	
	public int getBegin() {
		return (page - 1)*rows + 1;
	}
	
	public int getEnd() {
		return page*rows;
	}
	
	public int getTotalPages() {
		return (int) Math.ceil((double) totalRows/rows);
	}
	
	public int getTotalBlocks() {
		return (int) Math.ceil((double) getTotalPages()/pages);
	}
	
	public int getCurrentBlock() {
		return (int) Math.ceil((double) page/pages);
	}
	
	public int getBeginPage() {
		return (getCurrentBlock() - 1)*pages + 1;
	}
	
	public int getEndPage() {
		if (getCurrentBlock() == getTotalBlocks()) {
			return getTotalPages();
		}
		return getCurrentBlock()*pages;
	}
}
