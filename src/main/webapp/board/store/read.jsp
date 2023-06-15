<%@page import="vo.StoreBoard"%>
<%@page import="java.util.List"%>
<%@page import="dao.StoreBoardDao"%>
<%@page import="vo.TheaterBoard"%>
<%@page import="dao.TheaterBoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));

	// 글 번호에 해당하는 게시글 정보를 조회
	StoreBoardDao storeBoardDao = StoreBoardDao.getInstance();
	StoreBoard storeBoard = storeBoardDao.getAllStoreBoardsByNo(boardNo);
	
	// 게시글의 조회수를 +1하여 게시글 객체에 저장한다.
	storeBoard.setReadCnt(storeBoard.getReadCnt() + 1);
	
	// 조회수가 +1된 게시글 객체를 DB에 UPDATE한다.
	storeBoardDao.updatStoreBoard(storeBoard);
	
	// url 재요청
	response.sendRedirect("detail.jsp?no="+ boardNo);
%>