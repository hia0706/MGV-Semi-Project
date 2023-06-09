<%@page import="dao.ProductDao"%>
<%@page import="vo.ProductCategory"%>
<%@page import="vo.Product"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청파라미터값 조회
	int catNo = Integer.parseInt(request.getParameter("product-catNo"));
	String name = request.getParameter("product-name");
	int price = Integer.parseInt(request.getParameter("product-price"));
	int stock = Integer.parseInt(request.getParameter("product-stock"));
	String description = request.getParameter("product-description");
	
	Product product = new Product();
	product.setName(name);
	product.setPrice(price);
	product.setStock(stock);
	product.setDescription(description);
	product.setProductCategory(new ProductCategory(catNo));
	
	// 업무로직 수행
	ProductDao productDao = ProductDao.getInstance();
	// 해당 상품과 같은 이름의 상품이 존재하는지 체크
	if (productDao.getProductByName(name) != null) {
		// 해당 상품이 존재한다면 되돌아갈 URL
		response.sendRedirect("form.jsp?err=dup");
	}
	
	// 신규상품 등록
	productDao.insertProduct(product);
	
	response.sendRedirect("product/form.jsp");
	
%>