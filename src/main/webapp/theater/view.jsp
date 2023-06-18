<%@page import="com.google.gson.Gson"%>
<%@page import="vo.FavoriteTheater"%>
<%@page import="java.util.List"%>
<%@page import="dao.FavoriteTheaterDao"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%
	// 세션에서 로그인한 사용자 정보 가져오기
	String loginId = (String)session.getAttribute("loginId");
	// 자주가는 극장 정보 가져오기
	FavoriteTheaterDao fTheaterDao = FavoriteTheaterDao.getInstance();
	List<FavoriteTheater> FTList = fTheaterDao.getFavoriteTheaterById(loginId);
	
	// JSON으로 파싱
	Gson gson = new Gson();
	String text = gson.toJson(FTList);
	// 응답으로 json 텍스트를 보낸다.
	out.write(text);
%>