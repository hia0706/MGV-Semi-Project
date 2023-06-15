package vo;

import java.util.Date;

public class OneononeComment {

	private int no;
	private String content;
	private String deleted;
	private Date createDate;
	private Oneonone oneonone;
	private Member member;
	
	public OneononeComment() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Oneonone getOneonone() {
		return oneonone;
	}

	public void setOneonone(Oneonone oneonone) {
		this.oneonone = oneonone;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
}
