package vo;

public class FaqCategory {

	private int no;
	private String name;
	
	public FaqCategory() {}
	
	public FaqCategory(int no) {
		this.no = no;
	}
	
	public FaqCategory(String name) {
		this.name = name;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
