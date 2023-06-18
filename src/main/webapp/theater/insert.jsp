<%@page import="vo.Member"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="vo.Theater"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="vo.FavoriteTheater"%>
<%@page import="java.util.List"%>
<%@page import="dao.FavoriteTheaterDao"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%
	//세션에서 로그인한 사용자 정보 가져오기
	String loginId = (String)session.getAttribute("loginId");
	
	Member member = new Member();
	member.setId(loginId);
	// 클라이언트에서 보낸 리퀘스트 스트림 가져오기
	BufferedReader br = null;
	br = new BufferedReader(new InputStreamReader(request.getInputStream()));

	// 클라이언트에서 보낸 문자열 출력
	String returnMessage = br.readLine();		
	System.out.println(returnMessage);
	
	  // GSON 라이브러리로 읽기
    Gson gson = new Gson();
    
	
    List<Theater> theaters = gson.fromJson(returnMessage.toString(), new TypeToken<List<Theater>>(){}.getType());
	
	// 자주가는 극장 정보 지우기
	FavoriteTheaterDao fTheaterDao = FavoriteTheaterDao.getInstance();
	fTheaterDao.deleteFavoriteTheaterById(loginId);
	FavoriteTheater favoriteTheater = new FavoriteTheater();
	for(Theater theater:theaters){
		favoriteTheater.setTheater(theater);
		favoriteTheater.setMember(member);
		fTheaterDao.insertFavoriteTheater(favoriteTheater);
    }
	// 응답으로 json 텍스트를 보낸다.
%>