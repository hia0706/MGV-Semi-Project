<%@page import="vo.TboardReport"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.ReportReason"%>
<%@page import="dao.ReportDao"%>
<%@page import="vo.TboardComment"%>
<%@page import="dao.TboardCommentDao"%>
<%@page import="vo.TheaterBoard"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 URL
	// http://localhost/app3/board/detail.jsp?no=xxx
	
	//요청 파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String err = request.getParameter("err");
	String job = request.getParameter("job");

	// 업무로직수행 - 요청 파라미터로 전달받은 게시물번호에 해당하는 게시물 상세정보를 조회한다.
	TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
	TheaterBoard theaterBoard = theaterBoardDao.getTheaterBoardByNo(boardNo);
	String grade = theaterBoard.getGrade();
	String score = "";
	if (grade.equals("A")){
		score = "★★★★★";
	} else if (grade.equals("B")){
		score = "★★★★☆";
	} else if (grade.equals("C")){
		score = "★★★☆☆";
	} else if (grade.equals("D")){
		score = "★★☆☆☆";
	} else if (grade.equals("E")){
		score = "★☆☆☆☆";
	}
	
    TboardCommentDao tboardCommentDao = TboardCommentDao.getInstance();
    List<TboardComment> comments = tboardCommentDao.getCommentByBoardNo(boardNo);
	
	// 세션에서 로그인된 사용자 정보 조회하기
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");	

	// 에러메세지 출력
	if(loginId == null){
		response.sendRedirect("../../../member/loginform.jsp?err=req&job=" + URLEncoder.encode("게시판 관리", "utf-8"));
		return;
	}
	
	if (!"ADMIN".equals(loginType)) {
		response.sendRedirect("../../../board/theater/list.jsp?no=" + boardNo +"&err=type");
		return;
	}

	ReportDao reportDao = ReportDao.getInstance();
	List<ReportReason> reportReasons = reportDao.getReportReasonrs();
	
	
	// 신고 테이블 출력
	TboardReport report = reportDao.getTboardReportByBoardNo(boardNo);
	

%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<jsp:include page="../../nav.jsp">
	<jsp:param name="menu" value="게시글"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2"><%=theaterBoard.getName() %></h1>
		</div>

<%
	if("type".equals(err)){
%>
		<div class="alert alert-danger">
			<strong>관리자가 아니면 사용자의 게시물을 [<%=job %>]할 수 없습니다.</strong>
		</div>
<%
	}
%>
		
	</div>
	
	<div class="row mb-3">
		<div class="col-12">
			
			<p style="font-size : 12px; line-height: 15%; float:right;">댓글 <strong><%=theaterBoard.getCommentCnt() %></strong></p>
			<p style="font-size : 12px; line-height: 15%; float:right;">조회수 <strong><%=theaterBoard.getReadCnt()%>&nbsp;</strong></p>
			<p style="font-size : 10px; line-height: 15%;"><strong><%=theaterBoard.getLocation().getName() %>/<%=theaterBoard.getTheater().getName() %></strong></p>
			<p style="font-size : 12px; line-height: 15%;">작성자<strong> <%=theaterBoard.getMember().getId() %></strong></p>
			<p style="font-size : 12px; line-height: 15%;"><strong> <%=theaterBoard.getUpdateDate() %></strong></p>
			<hr>
			<div class="txc-textbox" style="background-color:#EFF8FB; border:#FFFFFF 1px solid; border-radius: 5px; padding: 20px;">
				<p><strong>별점 : <%=score %></strong></p>
				<p><%=theaterBoard.getContent() %></p>
			</div>
			
			<div class="text-end">
			
			<br>
			<br>

<%
	if("Y".equals(theaterBoard.getReport())){
%>
			<div class="txc-textbox" style="background-color:#EFF8FB; border:#FFFFFF 1px solid; border-radius: 5px; padding: 20px;">
				<p ><strong>아래의 이유로 신고가 접수되었습니다.</strong></p>
			</div>
			<div class="txc-textbox" style="background-color:#EFF8FB; border:#FFFFFF 1px solid; border-radius: 5px; padding: 20px;">
				<p ><strong>신고이유 : <%=report.getReason().getName() %></strong></p>
				<p ><%=report.getReasonContent() %></p>
			</div>

<%
	}
%>

				<a href="list.jsp" class="btn btn-primary btn-sm">목록</a>
<%
	if(("Y".equals(theaterBoard.getReport())&&"N".equals(theaterBoard.getDeleted()))|| ("N".equals(theaterBoard.getReport())&&"N".equals(theaterBoard.getDeleted()))){
%>		
				<a href="delete.jsp?no=<%=theaterBoard.getNo() %>" class="btn btn-danger btn-sm">삭제</a>

<%
	}
%>	

<%
	if("Y".equals(theaterBoard.getReport())&&"N".equals(theaterBoard.getDeleted())){
%>	
				<a href="reportEnable.jsp?no=<%=theaterBoard.getNo() %>" class="btn btn-secondary btn-sm">신고취소</a>
<%
	}
%>

<%
	if("Y".equals(theaterBoard.getDeleted())){
%>
				<a href="reportEnable.jsp?no=<%=theaterBoard.getNo() %>" class="btn btn-success btn-sm">복구</a>
<%
	}
%>
			</div>
		</div>
	</div>

</div>
</body>
</html>