<%@page import="dao.MovieBoardDao"%>
<%@page import="vo.MovieBoard"%>
<%@page import="vo.MboardComment"%>
<%@page import="dao.MboardCommentDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.StoreBoardDao"%>
<%@page import="dao.SboardCommentDao"%>
<%@page import="vo.StoreBoard"%>
<%@page import="dao.TboardCommentDao"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="vo.TheaterBoard"%>
<%@page import="vo.Member"%>
<%@page import="vo.SboardComment"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");
	
	if(loginId == null){
		response.sendRedirect("../../member/loginform.jsp?err=req&job=" + URLEncoder.encode("댓글등록", "utf-8"));
		return;
	}
	
	// 요청파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String content = request.getParameter("content");
	
	// 댓글 객체 생성후 댓글 정보 담기
	MboardComment mboardComment = new MboardComment();
	mboardComment.setContent(content);
	
	Member member = new Member();
	member.setId(loginId);
	mboardComment.setMember(member);

	MovieBoard movieBoard = new MovieBoard();
	movieBoard.setNo(boardNo);
	mboardComment.setMovieBoard(movieBoard);
	
	// 정보가 담긴 댓글 객체를 insert 한다.
	MboardCommentDao mboardCommentDao = MboardCommentDao.getInstance();
	mboardCommentDao.insertCommentToMboard(mboardComment);
	
	// boardNo로 게시물을 조회한다.
	MovieBoardDao movieBoardDao = MovieBoardDao.getInstance();
	MovieBoard savedMovieBoard = movieBoardDao.getMovieBoardByBoardNo(boardNo);
	
	
	// 조회된 게시물의 commentCnt를 +1하여 저장한다.
	savedMovieBoard.setCommentCnt(savedMovieBoard.getCommentCnt() + 1);
	
	// commentCnt가 1증가한 게시물 정보를 DB에 UPDATE한다.
	movieBoardDao.updateMovieBoard(savedMovieBoard);
	
	// url 재요청
	response.sendRedirect("detail.jsp?no="+boardNo);
	
%>