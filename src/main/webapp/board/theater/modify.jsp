<%@page import="java.net.URLEncoder"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="vo.Member"%>
<%@page import="vo.Theater"%>
<%@page import="vo.Location"%>
<%@page import="vo.TheaterBoard"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	// 세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");

	if(loginId == null){
		response.sendRedirect("../../member/login/form.jsp?err=req&job=" + URLEncoder.encode("게시물수정", "utf-8"));
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
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id&job="+URLEncoder.encode("수정", "utf-8"));
		// 게시물을 작성한 사용자가 맞으면 게시물 수정을 진행한다.
	} else if (savedTheaterBoard.getMember().getId().equals(loginId)) {
	
		// 요청 파라미터로 받은 수정 정보를 담는다.
		savedTheaterBoard.setName(name);
		savedTheaterBoard.setContent(content);
		
		Location location = new Location();
		location.setNo(locationNo);
		savedTheaterBoard.setLocation(location);
		
		Theater theater = new Theater();
		theater.setNo(theaterNo);
		savedTheaterBoard.setTheater(theater);
		
		Member member = new Member();
		member.setId(loginId);
		savedTheaterBoard.setMember(member);
		
		// 수정된 게시물 정보를 담은 게시물 정보를 DB에 UPDATE 한다.
		theaterBoardDao.updateTheaterBoard(savedTheaterBoard);
		
		// URL 재요청
		response.sendRedirect("detail.jsp?no="+boardNo);
		}
%>