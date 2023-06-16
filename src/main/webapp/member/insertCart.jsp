<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Product"%>
<%@page import="vo.Member"%>
<%@page import="vo.Cart"%>
<%@page import="dao.CartDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	int productNo = Integer.parseInt(request.getParameter("no"));
	
	int amount = Integer.parseInt(request.getParameter("amount"));
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	
	if (loginId == null) {
		response.sendRedirect("loginform.jsp?err=req&job="+URLEncoder.encode("스토어", "utf-8"));
		return;
	}
	
	Cart cart = new Cart();
	cart.setMember(new Member(loginId));
	cart.setProduct(new Product(productNo));
	cart.setAmount(amount);
	cart.setTotalPrice(totalPrice);
	
	CartDao cartDao = CartDao.getInstance();
	cartDao.insertCart(cart);
	
	response.sendRedirect("../store/detail.jsp?no=" + productNo);
%>






