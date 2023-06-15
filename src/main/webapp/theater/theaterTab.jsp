<%@page import="vo.Theater"%>
<%@page import="java.util.List"%>
<%@page import="dao.TheaterDao"%>
<%@page import="com.google.gson.Gson"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%
	// 1. 요청파라미터값 조회하기
	int locationNo = Integer.parseInt(request.getParameter("no"));
	
	// 2. 극장목록 조회하기
	TheaterDao theaterDao = TheaterDao.getInstance();
	List<Theater> theaters = theaterDao.getTheatersByLocNo(locationNo);
	// 3. 극장목록 정보를 json 형식의 텍스트로 변환한다.
	Gson gson = new Gson();
	String text = gson.toJson(theaters);
	// 4. 응답으로 json 텍스트를 보낸다.
	out.write(text);
%>
