package vo;

public class SboardReport {
	
	private int no;
	private String reasonContent;
	private ReportReason reason;
	private StoreBoard storeBoard;
	
	public SboardReport() {}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public ReportReason getReason() {
		return reason;
	}
	
	public void setReason(ReportReason reason) {
		this.reason = reason;
	}
	
	public String getReasonContent() {
		return reasonContent;
	}
	
	public void setReasonContent(String reasonContent) {
		this.reasonContent = reasonContent;
	}
	
	public StoreBoard getStoreBoard() {
		return storeBoard;
	}
	
	public void setStoreBoard(StoreBoard storeBoard) {
		this.storeBoard = storeBoard;
	}
	
}
