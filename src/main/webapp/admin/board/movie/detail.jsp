<%@page import="vo.MboardReport"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="util.StringUtils"%>
<%@page import="vo.MboardComment"%>
<%@page import="dao.MboardCommentDao"%>
<%@page import="vo.MovieBoard"%>
<%@page import="dao.MovieBoardDao"%>
<%@page import="vo.ReportReason"%>
<%@page import="dao.ReportDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 URL
	// http://localhost/app3/board/detail.jsp?no=xxx
	
	//요청 파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String err = request.getParameter("err");
	String job = request.getParameter("job");
	
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	String opt = StringUtils.nullToBlank(request.getParameter("opt"));
	String keyword = StringUtils.nullToBlank(request.getParameter("keyword"));

	// 업무로직수행 - 요청 파라미터로 전달받은 게시물번호에 해당하는 게시물 상세정보를 조회한다.
	MovieBoardDao movieBoardDao = MovieBoardDao.getInstance();
	MovieBoard movieBoard = movieBoardDao.getMovieBoardByBoardNo(boardNo);

	String grade = movieBoard.getGrade();
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
	
   // 세션에서 로그인된 사용자 정보 조회하기
  	String loginId = (String) session.getAttribute("loginId");
  	String loginType = (String) session.getAttribute("loginType");	

  	// 에러메세지 출력
  	if(loginId == null){
  		response.sendRedirect("../../../member/login/form.jsp?err=req&job=" + URLEncoder.encode("게시판 관리", "utf-8"));
  		return;
  	}
  	
  	if (!"ADMIN".equals(loginType)) {
  		response.sendRedirect("../../../board/movie/list.jsp?no=" + boardNo +"&err=type");
  		return;
  	}

  	ReportDao reportDao = ReportDao.getInstance();
  	List<ReportReason> reportReasons = reportDao.getReportReasonrs();
  	
  	
  	// 신고 테이블 출력
  	MboardReport report = reportDao.getMboardReportByBoardNo(boardNo);
  	
	

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
			<h1 class="border bg-light fs-4 p-2"><%=movieBoard.getName() %></h1>
		</div>

<%
	if("id".equals(err)){
%>
		<div class="alert alert-danger">
			<strong>다른 사용자의 게시글을 삭제할 수 없습니다.</strong>
		</div>
<%
	}
%>
	
<%
	if("Cid".equals(err)){
%>
		<div class="alert alert-danger">
			<strong>다른 사용자의 댓글을 삭제할 수 없습니다.</strong>
		</div>
<%
	}
%>
		

	</div>
	
	<div class="row mb-3">
		<div class="col-12">
			
			<p style="font-size : 12px; line-height: 15%; float:right;">댓글 <strong><%=movieBoard.getCommentCnt() %></strong></p>
			<p style="font-size : 12px; line-height: 15%; float:right;">조회수 <strong><%=movieBoard.getReadCnt()%>&nbsp;</strong></p>
			<p style="font-size : 10px; line-height: 15%;"><strong><%=movieBoard.getMovie().getTitle() %></strong></p>
			<p style="font-size : 12px; line-height: 15%;">작성자<strong> <%=movieBoard.getMember().getId() %></strong></p>
			<p style="font-size : 12px; line-height: 15%;"><strong> <%=movieBoard.getUpdateDate() %></strong></p>
			<hr>
			<div class="txc-textbox" style="background-color:#EFF8FB; border:#FFFFFF 1px solid; border-radius: 5px; padding: 20px;">
				<p><strong>별점 : <%=score %></strong></p>
				<p><%=movieBoard.getContent() %></p>
			</div>
			
			<div class="text-end">

			<br>
			<hr>		
<%
	if("Y".equals(movieBoard.getReport())){
%>
	
			<div>
				<div>
					<ul>
						<li style="font-size:16px; float:left"><strong>아래의 이유로 신고가 접수되었습니다.</strong></li><br>
						<li style="font-size:16px; float:left">삭제버튼을 눌러 신고된 게시글을 삭제하거나, 복구버튼을 눌러 신고처리를 취소하세요.</li>
					</ul>
					</div>
				
				<br>
				<div class="txc-textbox" style="background-color:#FFFFFF; border:#FBEFF5 1px solid;  padding: 20px;">
					<p style="float:left"><strong>신고이유 : <%=report.getReason().getName() %></strong></p><br><br>
					<p style="float:left"><%=report.getReasonContent() %></p><br>
				</div>
				<br>
			</div>

<%
	}
%>

<%
	if(("Y".equals(movieBoard.getReport())&&"N".equals(movieBoard.getDeleted()))&& ("N".equals(movieBoard.getReport())&&"N".equals(movieBoard.getDeleted()))){
%>

				<a href="list.jsp" class="btn btn-primary btn-sm">목록</a>
<%
	}
%>


<%
	if(("Y".equals(movieBoard.getReport())&&"N".equals(movieBoard.getDeleted()))|| ("N".equals(movieBoard.getReport())&&"N".equals(movieBoard.getDeleted()))){
%>		
				<a href="delete.jsp?no=<%=movieBoard.getNo() %>" class="btn btn-danger btn-sm">삭제</a>

<%
	}
%>	

<%
	if("Y".equals(movieBoard.getReport())&&"N".equals(movieBoard.getDeleted())){
%>	
				<a href="reportEnable.jsp?no=<%=movieBoard.getNo() %>" class="btn btn-secondary btn-sm">신고취소</a>
				<a href="reportlist.jsp" class="btn btn-primary btn-sm">목록</a>
<%
	}
%>

<%
	if("Y".equals(movieBoard.getDeleted())){
%>
				<a href="enable.jsp?no=<%=movieBoard.getNo() %>" class="btn btn-success btn-sm">복구</a>
				<a href="deletelist.jsp" class="btn btn-primary btn-sm">목록</a>
<%
	}
%>
   	
		
    	</div>
  	</div>
</div>

</div>

</body>
</html>