<%@page import="vo.StoreBoard"%>
<%@page import="dao.StoreBoardDao"%>
<%@page import="vo.SboardComment"%>
<%@page import="dao.SboardCommentDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.TheaterBoard"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="dao.TboardCommentDao"%>
<%@page import="vo.TboardComment"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");

	// 에러메세지 출력
	if(loginId == null){
		response.sendRedirect("../../member/loginform.jsp?err=req&job=" + URLEncoder.encode("댓글삭제", "utf-8"));
		return;
	}
	
	// 요청파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	int commentNo = Integer.parseInt(request.getParameter("cno"));
	
	// 댓글번호로 해당 댓글을 조회한다.
	SboardCommentDao sboardCommentDao = SboardCommentDao.getInstance();
	SboardComment sboardComment = sboardCommentDao.getCommentByCommentNo(commentNo);
	
	// 다른 사람의 댓글을 삭제하려고 하면 에러메세지 출력
	if(!loginId.equals(sboardComment.getMember().getId())){
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=Cid");
		return;
	}
	
	// 댓글 삭제
	sboardCommentDao.deleteCommentByCommentNo(commentNo);
	
	// 댓글수 감소시키기
	StoreBoardDao storeBoardDao = StoreBoardDao.getInstance();
	StoreBoard storeBoard = new StoreBoard();
	storeBoard.setCommentCnt(storeBoard.getCommentCnt() - 1);
	
	storeBoardDao.updatStoreBoard(storeBoard);
	
	response.sendRedirect("detail.jsp?no=" + boardNo);
%>