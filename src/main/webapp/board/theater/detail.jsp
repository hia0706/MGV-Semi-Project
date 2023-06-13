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
<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="게시글"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2"><%=theaterBoard.getName() %></h1>
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
	if("req".equals(err)){
%>
		<div class="alert alert-danger">
			<strong>로그인 필요</strong> [<%=job %>]은 로그인 후 사용가능한 서비스 입니다.
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
<%
	if (theaterBoard.getMember().getId().equals(loginId)) {
%>
				<a href="delete.jsp?no=<%=theaterBoard.getNo() %>" class="btn btn-danger btn-sm">삭제</a>
				<a href="modifyform.jsp?no=<%=theaterBoard.getNo() %>" class="btn btn-warning btn-sm">수정</a>
<%
	} else if (loginId != null &&!theaterBoard.getMember().getId().equals(loginId)) {
%>
				<a href="reportform.jsp?no=<%=theaterBoard.getNo() %>" class="btn btn-primary btn-sm">신고</a>
<%
	}
%>
				<a href="list.jsp" class="btn btn-primary btn-sm">목록</a>
			</div>
		</div>
	</div>
	<div class="row mb-3">
   		<div class="col-12">
			<form class="border bg-light p-2" method="post" action="insertComment.jsp">
				<input type="hidden" name="no" value=<%=theaterBoard.getNo() %> />
 				<div class="row">
					<div class="col-11">
						<textarea rows="2" class="form-control" name="content"></textarea>
					</div>
					<div class="col-1">
						<button class="btn btn-outline-primary h-100">등록</button>
					</div>
				</div>
			</form>   	
   		</div>
   	</div>
	<div class="row mb-3">
   		<div class="col-12">
<%
	for(TboardComment comment : comments) {
%>
			
   			<div class="border p-2 mb-2">
	   			<div class="d-flex justify-content-between mb-1">
	   				<span><%=comment.getMember().getId() %></span> <span class="text-muted"><%=comment.getCreaeDate() %></span>
	   			</div>
	   			<div>
	   				<%=comment.getContent() %>
				
	   				
<%
	if(comment.getMember().getId().equals(loginId)){
%>



	   				<a href="deleteComment.jsp?no=<%=theaterBoard.getNo() %>&cno=<%=comment.getCommentNo() %>" 
	   					class="btn btn-link text-danger text-decoration-none float-end"><i class="bi bi-trash"></i></a>

<%
	}
%>
	   			</div>   			
   			</div>
<%
	}
%>   			
   		</div>
   	</div>
</div>
</body>
</html>