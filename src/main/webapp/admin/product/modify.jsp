<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="vo.ProductCategory"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청파라미터값 조회
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	String soldOut = request.getParameter("soldOut");
	String description = request.getParameter("description");
	String composition = request.getParameter("composition");
	int catNo = Integer.parseInt(request.getParameter("catNo"));
	
	ProductCategory productCategory = new ProductCategory(catNo);
	
	// 요청파라미터로 전달받은 상품번호로 데이터베이스에 상품조회
	ProductDao productDao = ProductDao.getInstance();
	Product product = productDao.getProductByNo(no);
	
	// 요청파라미터로 전달받은 수정된 상품정보를 product객체에 저장해서 값을 덮어쓰기
	product.setName(name);
	product.setPrice(price);
	product.setStock(stock);
	product.setSoldOut(soldOut);
	product.setDescription(description);
	product.setComposition(composition);
	product.setProductCategory(productCategory);
	
	// 수정된 정보가 포함된 product객체를 전달해서 데이터 베이스에 반영시키기
	productDao.updateProduct(product);
	
	// 재요청 URL 응답
	response.sendRedirect("detail.jsp?no=" + no);
%>