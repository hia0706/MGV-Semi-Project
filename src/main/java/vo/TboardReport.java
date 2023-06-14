package vo;

public class TboardReport {
	
	private int no;
	private String reasonContent;
	private ReportReason reason;
	private TheaterBoard theaterBoard;
	
	public TboardReport() {}
	
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
	
	public TheaterBoard getTheaterBoard() {
		return theaterBoard;
	}
	
	public void setTheaterBoard(TheaterBoard theaterBoard) {
		this.theaterBoard = theaterBoard;
	}
}
