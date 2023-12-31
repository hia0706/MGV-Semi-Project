<%@page import="vo.LostitemComment"%>
<%@page import="dao.LostitemCommentDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.Lostitem"%>
<%@page import="dao.LostitemDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");
	String type = (String) session.getAttribute("loginType");		

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	if (member == null) {
		response.sendRedirect("../../../member/login/form.jsp?err=req&job="+URLEncoder.encode("고객센터 관리", "utf-8"));
		return;
	}
	
	if (!"ADMIN".equals(type)) {
		response.sendRedirect("../../../member/login/form.jsp?err=req&job="+URLEncoder.encode("고객센터 관리", "utf-8"));
		return;
	}

	// 분실물 문의글 번호 조회
	int no = Integer.parseInt(request.getParameter("no"));
	
	LostitemDao lostitemDao = LostitemDao.getInstance();
	Lostitem lostitem = lostitemDao.getLostitemByNo(no);
	
	// 해당 문의글의 커멘트목록 조회
	LostitemCommentDao lostitemcommentDao = LostitemCommentDao.getInstance();
	List<LostitemComment> lostitemcommentList = lostitemcommentDao.getCommentsByLostitemNo(no);

	
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>상세페이지 | 분실물 &#60; MGV 고객센터</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>

<div class="container mt-3">
	<div class="row">
		<div class="col-3">
			<div class="card">
       	  		<div class="card-header text-center" >고객센터</div>
    		
            		<div class="list-group">
  <a href="../home.jsp" class="list-group-item list-group-item-action">고객센터 홈</a>
  <a href="list.jsp" class="list-group-item list-group-item-action">분실물 문의</a>
  <a href="../oneonone/list.jsp" class="list-group-item list-group-item-action">1:1 문의</a>
  <a href="../faq/list.jsp" class="list-group-item list-group-item-action">자주 묻는 질문</a>
  <a href="../notice/list.jsp" class="list-group-item list-group-item-action">공지사항</a>
     <a class="list-group-item list-group-item-action disabled" style="color:gray; font-size:15px;">
  		MGV 고객센터 <br> 
  		Dream center <br><br>
  		TEL 0607-0620<br> 
  		<img src="../../../images/center/clock.png" width="13" height="13"> 10:00~19:00
  </a>
					</div>
					</div>
		</div>
		<div class="col-9">
        	<h1 class="fs-2 p-2">분실물 문의내역</h1>
		<hr>
			<a style="font-size : 19px;">[지점] [<%=lostitem.getTheater().getName() %>] <%=lostitem.getTitle() %></a><br>
			<a style="font-size : 12px;">영화관 <%=lostitem.getTheater().getName() %> | </a>
			<a style="font-size : 12px;">등록일 <%=lostitem.getCreateDate() %></a>
		<hr>
			<a><%=lostitem.getContent() %></a>
			<br>
			<br>
			<br>
			<br>
			<br>
			
<% if (lostitem.getFileName() != null) { %>			
			<img src="../../../images/lostitem/<%=lostitem.getFileName() %>" />
<% } %>				
			
		<hr>
			<form  method="post" action="insertComment.jsp">
				<input type="hidden" name="no" value="<%=lostitem.getNo() %>" />
 				<div class="row">
					<div class="col-11">
						<textarea rows="2" class="form-control" name="content"></textarea>
					</div>
					<div class="col-1">
						<button class="btn btn-outline-secondary h-100">등록</button>
					</div>
				</div>
			</form>   	
		<hr>
		
		<div class="row mb-3">
   			<div class="col-12">
   		
<% for (LostitemComment lostitemComment : lostitemcommentList) { %>   		
   		
   				<div class="border p-2 mb-2">
	   			
	   				<div>
	   					<%=lostitemComment.getContent() %>
	   				
<%  if (lostitemComment.getMember().getId().equals(id)) { %>	   				
	   				<a href="deleteComment.jsp?no=<%=no %>&cno=<%=lostitemComment.getNo() %>" 
	   					class="btn btn-link text-danger text-decoration-none float-end"><i class="bi bi-trash"></i></a>
	   					
<%  } %>	 
	 
	   				</div>   			
   				</div>
   	
<% } %>	   	
   		</div>
   	</div>
		
		
		
		<div style="text-align: center; padding:30px;">
				<a href="list.jsp" class="btn btn-secondary btn-sm">목록</a>
				<a href="delete.jsp?no=<%=lostitem.getNo() %>" class="btn btn-danger btn-sm">삭제</a>
		</div>
	
			
		</div>
    </div>  
</div>
</body>
</html>










