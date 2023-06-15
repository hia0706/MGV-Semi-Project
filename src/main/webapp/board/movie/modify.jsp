<%@page import="vo.Movie"%>
<%@page import="vo.MovieBoard"%>
<%@page import="dao.MovieBoardDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.Member"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	// 세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");

	if(loginId == null){
		response.sendRedirect("../../member/loginform.jsp?err=req&job=" + URLEncoder.encode("게시물수정", "utf-8"));
		return;
	}
	
	// 요청파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	int movieNo = Integer.parseInt(request.getParameter("movieNo"));
	String content = request.getParameter("content");
	
	// 다른사용자의 게시물을 수정하려 시도했을시 에러메세지 출력
	MovieBoardDao movieBoardDao = MovieBoardDao.getInstance();
	MovieBoard savedMovieBoard = movieBoardDao.getMovieBoardByBoardNo(boardNo);
	
	if (!savedMovieBoard.getMember().getId().equals(loginId)){
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id&job="+URLEncoder.encode("수정", "utf-8"));
		
	// 게시물을 작성한 사용자가 맞으면 게시물 수정을 진행한다.
	} else if (savedMovieBoard.getMember().getId().equals(loginId)) {
	
		// 요청 파라미터로 받은 수정 정보를 위에서 게시물 번호로 조회한 객체에 저장한다.
		savedMovieBoard.setName(name);
		savedMovieBoard.setContent(content);
		
		Movie movie = new Movie();
		movie.setNo(movieNo);
		savedMovieBoard.setMovie(movie);
		
		Member member = new Member();
		member.setId(loginId);
		savedMovieBoard.setMember(member);
		
		// 수정된 게시물 정보를 담은 게시물 정보를 DB에 UPDATE 한다.
		movieBoardDao.updateMovieBoard(savedMovieBoard);
		
		// URL 재요청
		response.sendRedirect("detail.jsp?no="+boardNo);
		}
%>