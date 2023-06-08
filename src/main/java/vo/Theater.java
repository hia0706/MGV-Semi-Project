package vo;

public class Theater {
	private int no;
	private Location location;
	private String name;
	private String address1; // 일반주소
	private String address2; // 도로명주소
	private String tel;
	private String disable;
	
	public Theater() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getDisable() {
		return disable;
	}
	
	public void setDisable(String disable) {
		this.disable = disable;
	}
}
