<%@page import="java.util.HashSet"%>
<%@page import="service.SampleService"%>
<%@page import="vo.Movie"%>
<%@page import="java.util.List"%>
<%@page import="dao.ManagerMovieDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
/*
		업무로직 1줄 요약
		-> 영진위 차트의 영화들중 db에 없는 영화는 새로 인서트 하고, 있는 영화는 업데이트 한뒤,
			차트밖영화들 전부 업데이트
		
		1. 영진위, KMDB에서 전날 박스오피스 10위까지 영화의 데이터를 가져와서 List<Movie> 객체에 담은 후,
		2. 기존 DB저장된영화들을 다른 콜렉션에 담아두고,
		3. 1번의 차트영화들 로직수행하면서 DB저장된 리스트에서 하나씩 remove 해준다.
		4. 그 뒤 remove하고 남은 영화들의 필드(랭킹, 랭킹증감, 차트진입여부, 업데이트데이트) default 값으로 초기화한다.
			
*/


// 세션에서 로그인타입 속성획득
	String loginType = (String) session.getAttribute("loginType");

// 로그인타입 관리자아니면 로그인으로 리다이렉트시킴
	if (!"ADMIN".equals(loginType)){
		response.sendRedirect("../member/login/login.jsp");
		return;
	}
	
	ManagerMovieDao managerMovieDao= ManagerMovieDao.getInstance();
	SampleService service=SampleService.getInstance();
	List<Movie> movies= service.getMovies();
	
	HashSet<Integer> movieNos= 	managerMovieDao.getMovieNos();
	
	for (Movie movie: movies){
		if (movieNos.contains(movie.getNo())){
			managerMovieDao.updateMovie(movie);
			movieNos.remove(movie.getNo());
		}else {
			managerMovieDao.insertMovie(movie);
		}
	}
	
	for (int movieNo : movieNos){
		managerMovieDao.initChart(movieNo);
	}
	

	// 재요청URL 응답
	response.sendRedirect("list.jsp");

%>