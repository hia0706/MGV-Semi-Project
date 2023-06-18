<%@page import="vo.SboardReport"%>
<%@page import="vo.StoreBoard"%>
<%@page import="dao.StoreBoardDao"%>
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
		response.sendRedirect("../../member/login/form.jsp?err=req&job=" + URLEncoder.encode("게시물신고", "utf-8"));
		return;
	}
	
	// 요청파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String content = request.getParameter("reasonContent");
	int reasonNo = Integer.parseInt(request.getParameter("reasonNo"));
	
	// 조회된 게시물 번호로 게시물을 조회한다
	StoreBoardDao storeBoardDao = StoreBoardDao.getInstance();
	StoreBoard savedStoreBoard = storeBoardDao.getAllStoreBoardsByNo(boardNo);
	
	// 조회된 게시물의 신고 정보를 "Y" 로 변경한뒤 DB에 저장한다.
	savedStoreBoard.setReport("Y");
	storeBoardDao.updatStoreBoard(savedStoreBoard);
	
	// 게시물 신고 정보를 저장할 신고객체를 생성한다.
	SboardReport sboardReport = new SboardReport();
	
	StoreBoard storeBoard = new StoreBoard();
	storeBoard.setNo(boardNo);
	sboardReport.setStoreBoard(storeBoard);
	
	ReportReason reason = new ReportReason();
	reason.setNo(reasonNo);
	sboardReport.setReason(reason);
	
	sboardReport.setReasonContent(content);
	
	// 신고객체를 신고테이블에 insert한다.
	ReportDao reportDao = ReportDao.getInstance();
	reportDao.insertSboardReport(sboardReport);
	
	response.sendRedirect("list.jsp");
	
%>