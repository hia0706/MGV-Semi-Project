<%@page import="dao.TheaterBoardDao"%>
<%@page import="vo.Member"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Theater"%>
<%@page import="vo.Location"%>
<%@page import="vo.TheaterBoard"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%
	// 세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");
/*	
	if(loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job="+URLEncoder.encode("게시물등록","utf-8"));
		return;
	}
*/
	String name = request.getParameter("name");
	int locationNo = Integer.parseInt(request.getParameter("locationNo"));
	int theaterNo = Integer.parseInt(request.getParameter("theaterNo"));
	String content = request.getParameter("content");
	String grade = request.getParameter("grade");
	
	TheaterBoard theaterBoard = new TheaterBoard();
	theaterBoard.setName(name);
	theaterBoard.setContent(content);
	theaterBoard.setGrade(grade);
	
	Location location = new Location();
	location.setNo(locationNo);
	theaterBoard.setLocation(location);
	
	Theater theater = new Theater();
	theater.setNo(theaterNo);
	theaterBoard.setTheater(theater);
	
	Member member = new Member();
	member.setId(loginId);
	theaterBoard.setMember(member);
	
	TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
	theaterBoardDao.insertTheaterBoard(theaterBoard);
	
	response.sendRedirect("list.jsp");
	
%>