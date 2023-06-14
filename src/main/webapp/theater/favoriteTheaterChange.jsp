<%@page import="dao.FavoriteTheaterDao"%>
<%@page import="vo.FavoriteTheater"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//세션에서 로그인한 사용자 정보 가져오기
	String loginId = (String)session.getAttribute("loginId");
	
	// 파라미터 극장번호
	int theaterNo = Integer.parseInt(request.getParameter("no"));
	
	// 자주가는 극장 정보 가져오기
	FavoriteTheaterDao fTheaterDao = FavoriteTheaterDao.getInstance();
	FavoriteTheater favoriteTheater = fTheaterDao.getFavoriteTheaterByKey(loginId, theaterNo);
	
	// 등록된 극장의 갯수가 3개 이상인지 비교
	
	// 3개 이상이면 경고창
	
	// 이미 등록된 극장인지 비교
	
	// 이미 등록된 극장이면 취소할건지 확인
	
	// 취소 선택하면 삭제
	
	// 2개 이하이고 등록되지 않은 극장이면 추가.
%>