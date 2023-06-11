<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 URL : http://localhost/mgv/admin/product/delete.jsp?no=???
			
	// 요청파라미터값 조회
	String name = request.getParameter("name");

	// 업무로직 수행 - 요청파라미터로 전달받은 상품번호에 해당하는 상품정보 삭제하기
	ProductDao productDao = ProductDao.getInstance();
	productDao.deleteProductByName(name);
	
	// 재요청 URL 응답보내기 : http://localhost/mgv/admin/product/list.jsp
	response.sendRedirect("list.jsp");
%>