<%@page import="java.net.URLEncoder"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="vo.Member"%>
<%@page import="vo.Theater"%>
<%@page import="vo.Location"%>
<%@page import="vo.TheaterBoard"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");

	// 에러메세지 출력
	MemberDao memberDao = MemberDao.getInstance();
	Member savedmember = memberDao.getMemberById(loginId);
   
	if (savedmember == null) {
	   response.sendRedirect("../../member/loginform.jsp?err=fail");
	   return;
	}
	
	// 요청파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	int locationNo = Integer.parseInt(request.getParameter("locationNo"));
	int theaterNo = Integer.parseInt(request.getParameter("theaterNo"));
	String content = request.getParameter("content");
	
	// 다른사용자의 게시물을 수정하려 시도했을시 에러메세지 출력
	TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
	TheaterBoard savedTheaterBoard = theaterBoardDao.getTheaterBoardByNo(boardNo);
	if (!savedTheaterBoard.getMember().getId().equals(loginId)){
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id&job="+URLEncoder.encode("댓글삭제", "utf-8"));
	}
	
	TheaterBoard theaterBoard = new TheaterBoard();
	theaterBoard.setName(name);
	theaterBoard.setContent(content);
	
	Location location = new Location();
	location.setNo(locationNo);
	theaterBoard.setLocation(location);
	
	Theater theater = new Theater();
	theater.setNo(theaterNo);
	theaterBoard.setTheater(theater);
	
	Member member = new Member();
	member.setId(loginId);
	theaterBoard.setMember(member);
	
	theaterBoardDao.updateTheaterBoard(theaterBoard);
	
	response.sendRedirect("detail.jsp?no="+boardNo);
%>