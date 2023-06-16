package vo;

public class MboardReport {
	
	private int no;
	private String reasonContent;
	private ReportReason reason;
	private MovieBoard movieBoard;
	
	public MboardReport() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getReasonContent() {
		return reasonContent;
	}

	public void setReasonContent(String reasonContent) {
		this.reasonContent = reasonContent;
	}

	public ReportReason getReason() {
		return reason;
	}

	public void setReason(ReportReason reason) {
		this.reason = reason;
	}

	public MovieBoard getMovieBoard() {
		return movieBoard;
	}

	public void setMovieBoard(MovieBoard movieBoard) {
		this.movieBoard = movieBoard;
	}
	
	
}
