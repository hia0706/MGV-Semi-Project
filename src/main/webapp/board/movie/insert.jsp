<%@page import="dao.MovieBoardDao"%>
<%@page import="vo.Movie"%>
<%@page import="vo.MovieBoard"%>
<%@page import="dao.StoreBoardDao"%>
<%@page import="vo.Product"%>
<%@page import="vo.StoreBoard"%>
<%@page import="vo.ProductCategory"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="vo.Member"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Theater"%>
<%@page import="vo.Location"%>
<%@page import="vo.TheaterBoard"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%
	//세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");

	if(loginId == null){
		response.sendRedirect("../../member/loginform.jsp?err=req&job=" + URLEncoder.encode("게시물등록", "utf-8"));
		return;
	}
	
	// 요청 파라미터 조회
	String name = request.getParameter("name");
	int movieNo = Integer.parseInt(request.getParameter("no"));
	String content = request.getParameter("content");
	String grade = request.getParameter("grade");
	
	// 인서트할 정보를 영화 게시물 객체에 담기
	MovieBoard movieBoard = new MovieBoard();
	movieBoard.setName(name);
	movieBoard.setContent(content);
	movieBoard.setGrade(grade);
	
	Member member = new Member();
	member.setId(loginId);
	movieBoard.setMember(member);
	
	Movie movie = new Movie();
	movie.setNo(movieNo);
	movieBoard.setMovie(movie);
	
	
	// 정보가 담긴 객체를 인서트 하기
	MovieBoardDao movieBoardDao = MovieBoardDao.getInstance();
	movieBoardDao.insertMovieBoard(movieBoard);
	
	// 재요청 url
	response.sendRedirect("list.jsp");
	
%>