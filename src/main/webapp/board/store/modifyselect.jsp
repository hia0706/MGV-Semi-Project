<%@page import="dto.ModifyDto"%>
<%@page import="vo.Product"%>
<%@page import="vo.StoreBoard"%>
<%@page import="dao.StoreBoardDao"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%
	int catNo = Integer.parseInt(request.getParameter("cNo"));
	int boardNo = Integer.parseInt(request.getParameter("bNo"));
	
	ModifyDto modifyDto = new ModifyDto();
	
	StoreBoardDao storeBoardDao = StoreBoardDao.getInstance();
	List<Product> products = storeBoardDao.getProductsByCatNo(catNo);
	modifyDto.setProduct(products);
	
	StoreBoard storeBoard = storeBoardDao.getAllStoreBoardsByNo(boardNo);
	int productNo = storeBoard.getProduct().getNo();
	modifyDto.setProductNo(productNo);
	
	Gson gson = new Gson();
	String text = gson.toJson(modifyDto);	
	
	out.write(text);
%>
