<%@page import="vo.Theater"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.FavoriteTheaterDao"%>
<%@page import="vo.FavoriteTheater"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);


	if (member == null) {
		response.sendRedirect("../member/loginform.jsp?err=req&job="+URLEncoder.encode("즐겨찾기", "utf-8"));
		return;
	}
	
	// 파라미터 극장번호
	int theaterNo = Integer.parseInt(request.getParameter("no"));
	
	Theater theater = new Theater();
	theater.setNo(theaterNo);
	// vo에 담기
	FavoriteTheater favoriteTheater = new FavoriteTheater();
	favoriteTheater.setMember(member);
	favoriteTheater.setTheater(theater);
	// 자주가는 극장 정보 가져오기
	FavoriteTheaterDao fTheaterDao = FavoriteTheaterDao.getInstance();
	// 등록된 극장인지 확인
	if(fTheaterDao.getFavoriteTheaterByKey(id, theaterNo)!=null){
		// 삭제
		fTheaterDao.deleteFavoriteTheater(favoriteTheater);
		
	}
	//돌아가기
	response.sendRedirect("../theater/detail.jsp?no="+theaterNo);
%>