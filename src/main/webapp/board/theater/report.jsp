<%@page import="dao.ReportDao"%>
<%@page import="vo.ReportReason"%>
<%@page import="vo.TboardReport"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.TheaterBoard"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");
	
	if(loginId == null){
		response.sendRedirect("../../member/loginform.jsp?err=req&job=" + URLEncoder.encode("게시물신고", "utf-8"));
		return;
	}
	
	// 요청파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String content = request.getParameter("reasonContent");
	int reasonNo = Integer.parseInt(request.getParameter("reasonNo"));
	
	// 조회된 게시물 번호로 게시물을 조회한다
	TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
	TheaterBoard savedTheaterBoard = theaterBoardDao.getTheaterBoardByNo(boardNo);
	
	
	// 조회된 게시물의 신고 정보를 "Y" 로 변경한뒤 DB에 저장한다.
	savedTheaterBoard.setReport("Y");
	theaterBoardDao.updateTheaterBoard(savedTheaterBoard);
	
	// 게시물 신고 정보를 저장할 신고객체를 생성한다.
	TboardReport tboardReport = new TboardReport();
	
	TheaterBoard theaterBoard = new TheaterBoard();
	theaterBoard.setNo(boardNo);
	tboardReport.setTheaterBoard(theaterBoard);
	
	ReportReason reason = new ReportReason();
	reason.setNo(reasonNo);
	tboardReport.setReason(reason);
	
	tboardReport.setReasonContent(content);
	
	// 신고객체를 신고테이블에 insert한다.
	ReportDao reportDao = ReportDao.getInstance();
	reportDao.insertTboardReport(tboardReport);
	
	response.sendRedirect("list.jsp");
	
%>