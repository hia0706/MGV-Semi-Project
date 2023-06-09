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
%>