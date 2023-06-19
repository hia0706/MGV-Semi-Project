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
	
	ReportDao reportReasonDao = ReportDao.getInstance();
	List<ReportReason> reportReasons = reportReasonDao.getReportReasonrs();
	

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
			<strong>다른 사용자의 게시글을 [<%=job %>]할 수 없습니다.</strong>
		</div>
<%
	}
%>

<%
	if("type".equals(err)){
%>
		<div class="alert alert-danger">
			<strong>관리자가 아니면 사용자의 게시물을 [<%=job %>]할 수 없습니다.</strong>
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
				<button class="btn btn-primary btn-sm"  data-bs-toggle="modal" data-bs-target="#exampleModal">신고</button>
				
<%
	}
%>
				<a href="list.jsp" class="btn btn-primary btn-sm">목록</a>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	function reportform(){
		open("reportform.jsp?no=<%=boardNo %>", "popup", "width=600, height=500")
		
		
	}
</script>

<%-- 댓글 --%>	
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
   	
   	
<%-- 신고 모달 --%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header">
        		<h1 class="modal-title fs-5" id="exampleModalLabel">게시물 신고</h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
      		<div class="modal-body">
       			<div class="row mb-3">
		<div class="col-12">
			<p style="font-size : 18px;"><strong>이 게시물을 신고하는 이유</strong></p>
			<p style="font-size : 15px;">지식재산권 침해를 신고하는 경우를 제외하고 회원님의 신고는익명으로 처리됩니다. 누군가 위급한 상황에 있다고 생각된다면 즉시 현지 응급 서비스 기관에 연락하시기 바랍니다.</p>
			
			<form class="border bg-light p-3" method="get" action="report.jsp?no=<%=boardNo %>" >
				<input type="hidden" name="no" value="<%=boardNo %>">
	
				<div class="form-group mb-2" style="width: 33%; padding:5px;">
					<label class="form-label">신고이유</label>
					<select class="form-select" name="reasonNo" id="selectbox" >
		<%
			for (ReportReason reason : reportReasons){
		%>
							<option value="<%=reason.getNo() %>"><%=reason.getName() %></option>
		<%
			}
		%>
							</select>
						</div>
						
						
						<div class="form-group mb-2">
							<label class="form-label">상세내용</label>
							<textarea rows="5" class="form-control" name="reasonContent" ></textarea>
						</div>
		
		
				
						<div class="text-end">
							<button type="reset" class="btn btn-secondary btn-sm" >취소</button>
							<button type="submit" class="btn btn-primary btn-sm" >신고</button>
						</div>
					</form>
					
					
					
				</div>
			</div>
      		</div>
    	</div>
  	</div>
</div>
</div>
</body>
</html>