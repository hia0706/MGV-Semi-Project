	<%@page import="vo.Product"%>
<%@page import="vo.StoreBoard"%>
<%@page import="dao.StoreBoardDao"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%
	int catNo = Integer.parseInt(request.getParameter("no"));

	StoreBoardDao storeBoardDao = StoreBoardDao.getInstance();
	List<Product> products = storeBoardDao.getProductsByCatNo(catNo);
	
	Gson gson = new Gson();
	String text = gson.toJson(products);	
	
	out.write(text);
%>
