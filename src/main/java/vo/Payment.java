package vo;

import java.sql.Date;
// 구매내역
public class Payment {

	private int no;
	private Date createDate;
	private Date updateDate;
	private String canceld;
	private Member member;
	private Product product;
	
	public Payment() {}
	
	public Payment(int no) {
		this.no = no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getCanceld() {
		return canceld;
	}

	public void setCanceld(String canceld) {
		this.canceld = canceld;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}
