package vo;

import java.util.Date;

public class MboardComment {
	
	private int commentNo;
	private Date creaeDate;
	private Date updateDate;
	private String content;
	private Member member;
	private String deleted;
	private MovieBoard movieBoard;
	
	public MboardComment() {}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public Date getCreaeDate() {
		return creaeDate;
	}

	public void setCreaeDate(Date creaeDate) {
		this.creaeDate = creaeDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public MovieBoard getMovieBoard() {
		return movieBoard;
	}

	public void setMovieBoard(MovieBoard movieBoard) {
		this.movieBoard = movieBoard;
	}
	
	
}
