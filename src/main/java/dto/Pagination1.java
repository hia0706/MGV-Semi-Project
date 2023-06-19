package dto;

public class Pagination1 {
	private int page;			// 요청한 페이지 번호
	private int rows = 10;		// 한 화면에 표시할 행의 갯수
	private int pages = 5;		// 한 화면에 표시할 페이지번호 갯수
	private int totalRows;		// 전체 데이터 갯수
	private int begin;
	private int end;
	private int totalPages;
	private int totalBlocks;
	private int currentBlock;
	private int beginPage;
	private int endPage;
	private boolean isFirstPage;
	private boolean isLastPage;
	
	
	public Pagination1(int page, int totalRows) {
		this.page = page;
		this.totalRows = totalRows;	
		this.totalPages = (int) Math.ceil((double) totalRows/rows);
		this.totalBlocks = (int) Math.ceil((double) totalPages/pages);
		this.currentBlock = (int) Math.ceil((double) page/pages);
		
		this.begin = (page - 1)*rows + 1;
		this.end = page * rows;
		
		this.beginPage = (currentBlock - 1)*pages + 1;
		this.endPage = currentBlock*pages;
		if (currentBlock == totalBlocks) {
			this.endPage = totalPages;
		}
		this.isFirstPage = page <= 1;
		this.isLastPage = page >= totalPages;
	}

	public int getBegin() {
		return begin;
	}
	
	public int getEnd() {
		return end;
	}

	public int getPageNo() {
		return page;
	}
	


	public void setPage(int page) {
		this.page = page;
	}


	public int getRows() {
		return rows;
	}


	public void setRows(int rows) {
		this.rows = rows;
	}


	public int getPages() {
		return pages;
	}


	public void setPages(int pages) {
		this.pages = pages;
	}


	public int getTotalRows() {
		return totalRows;
	}


	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}


	public int getTotalPages() {
		return totalPages;
	}


	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}


	public int getTotalBlocks() {
		return totalBlocks;
	}


	public void setTotalBlocks(int totalBlocks) {
		this.totalBlocks = totalBlocks;
	}


	public int getCurrentBlock() {
		return currentBlock;
	}


	public void setCurrentBlock(int currentBlock) {
		this.currentBlock = currentBlock;
	}


	public int getBeginPage() {
		return beginPage;
	}


	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public boolean isFirstPage() {
		return isFirstPage;
	}


	public void setFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}


	public boolean isLastPage() {
		return isLastPage;
	}


	public void setLastPage(boolean isLastPage) {
		this.isLastPage = isLastPage;
	}
}
