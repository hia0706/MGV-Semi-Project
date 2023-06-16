package dto;

import java.util.List;

import vo.Product;
import vo.StoreBoard;
import vo.Theater;
import vo.TheaterBoard;

public class ModifyDto {
	
	private List<Product> product;
	private List<Theater> theater;
	private int productNo;
	private int theaterNo;
	
	public ModifyDto() {}

	public List<Product> getProduct() {
		return product;
	}
	
	public void setProduct(List<Product> product) {
		this.product = product;
	}
	
	public List<Theater> getTheater() {
		return theater;
	}
	
	public void setTheater(List<Theater> theater) {
		this.theater = theater;
	}
	
	public int getProductNo() {
		return productNo;
	}
	
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	
	public int getTheaterNo() {
		return theaterNo;
	}
	
	public void setTheaterNo(int theaterNo) {
		this.theaterNo = theaterNo;
	}
	
}
