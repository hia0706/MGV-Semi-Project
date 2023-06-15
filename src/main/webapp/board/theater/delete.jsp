<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.TheaterBoard"%>
<%@page import="dao.TheaterBoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");
	
	// 에러메세지 출력
	if(loginId == null){
		response.sendRedirect("../../member/loginform.jsp?err=req&job=" + URLEncoder.encode("삭제", "utf-8"));
		return;
	}
	
	// 요청파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	
	// 조회된 게시물 번호로 게시물을 조회한다
	TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
	TheaterBoard theaterBoard = theaterBoardDao.getTheaterBoardByNo(boardNo);
	
	// 해당 게시물의 작성자가 아닌 다른 사용자가 게시물을 삭제하려 했을 때 에러메세지를 출력한다.
	if (!theaterBoard.getMember().getId().equals(loginId)){
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id&job="+URLEncoder.encode("삭제", "utf-8"));
	} else if (theaterBoard.getMember().getId().equals(loginId)){
	
		// 해당 게시물의 작성자가 맞을 경우엔 조회된 게시물의 삭제 정보를 "Y" 로 변경한뒤 DB에 저장한다. + url 재요청
		theaterBoard.setDeleted("Y");
		theaterBoardDao.updateTheaterBoard(theaterBoard);
		
		response.sendRedirect("list.jsp");
	}
%>