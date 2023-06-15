<%@page import="dao.StoreBoardDao"%>
<%@page import="vo.Product"%>
<%@page import="vo.StoreBoard"%>
<%@page import="vo.ProductCategory"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="vo.Member"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Theater"%>
<%@page import="vo.Location"%>
<%@page import="vo.TheaterBoard"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%
	//세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");

	if(loginId == null){
		response.sendRedirect("../../member/loginform.jsp?err=req&job=" + URLEncoder.encode("게시물등록", "utf-8"));
		return;
	}
	
	// 요청 파라미터 조회
	String name = request.getParameter("name");
	int catNo = Integer.parseInt(request.getParameter("catNo"));
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	String content = request.getParameter("content");
	String grade = request.getParameter("grade");
	
	// 인서트할 정보를 스토어 게시물 객체에 담기
	StoreBoard storeBoard = new StoreBoard();
	storeBoard.setName(name);
	storeBoard.setContent(content);
	storeBoard.setGrade(grade);
	
	ProductCategory category = new ProductCategory();
	category.setNo(catNo);
	storeBoard.setCategory(category);
	
	Product product = new Product();
	product.setNo(productNo);
	storeBoard.setProduct(product);
	
	Member member = new Member();
	member.setId(loginId);
	storeBoard.setMember(member);
	
	// 정보가 담긴 객체를 인서트 하기
	StoreBoardDao storeBoardDao = StoreBoardDao.getInstance();
	storeBoardDao.insertStoreBoard(storeBoard);
	
	// 재요청 url
	response.sendRedirect("list.jsp");
	
%>