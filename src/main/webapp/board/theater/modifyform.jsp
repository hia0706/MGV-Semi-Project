<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="vo.TheaterBoard"%>
<%@page import="vo.Theater"%>
<%@page import="dao.TheaterDao"%>
<%@page import="vo.Location"%>
<%@page import="java.util.List"%>
<%@page import="dao.LocationDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");
	
	// 에러메세지 출력
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(loginId);
	
	if (member == null) {
	   response.sendRedirect("../../member/loginform.jsp?err=fail");
	   return;
	}

	
	int boardNo = Integer.parseInt(request.getParameter("no"));
	
	LocationDao locationDao = LocationDao.getInstance();
	List<Location> locations = locationDao.getLocations();
	
	TheaterDao theaterDao = TheaterDao.getInstance();
	List<Theater> theaters = theaterDao.getAllTheaters();
	
	// 다른사용자의 게시물을 수정하려 시도했을시 에러메세지 출력
	TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
	TheaterBoard theaterBoard = theaterBoardDao.getTheaterBoardByNo(boardNo);	
	if (!theaterBoard.getMember().getId().equals(loginId)){
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id&job="+URLEncoder.encode("댓글삭제", "utf-8"));
	}

	int locationNo = theaterBoard.getLocation().getNo();
	int theaterNo = theaterBoard.getTheater().getNo();
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
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="게시판"/>
</jsp:include>

<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
         	<h1 class="border bg-light fs-4 p-2">게시글 등록폼</h1>
      	</div>
	</div>  
	<div class="row mb-3">
		<div class="col-12">
			<p>제목과 내용을 입력하세요</p>		
			<form class="border bg-light p-3" method="post" action="modify.jsp" >
				<input type="hidden" name="no" value="<%=boardNo %>">
				<div class="form-group mb-2">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="name" value="<%=theaterBoard.getName() %>"/>
				</div>

				<div class="txc-textbox" style="background-color:#FAFAFA; border:#FFFFFF 4px solid; border-radius: 5px; width: 33%; padding:10px; float: left;" >
					<label class="form-label">별점은 변경하실 수 없습니다.</label>
					<p>별점 : <%=score %></p>
				</div>				
								
				<div class="form-group mb-2" style="float: left; width: 33%; padding:10px;">
					<label class="form-label">지역</label>
					<select class="form-select" name="locationNo" id="selectbox" >
<%
	for (Location location : locations){
%>
					<option value="<%=location.getNo() %>"<%=location.getNo() == locationNo ? "selected" : ""%> ><%=location.getName() %></option>
<%
	}
%>
					</select>
				</div>
				
				<div class="form-group mb-2" style="float: left; width: 33%; padding:10px;">
					<label class="form-label">극장</label>
					<select class="form-select" name="theaterNo">
<%
	for (Theater theater : theaters){
%>
					<option value="<%=theater.getNo() %>"<%=theater.getNo() == theaterNo ? "selected" : ""%> ><%=theater.getName() %></option>
<%
	}
%>

					</select><br>
				</div>
			
				
				<div class="form-group mb-2">
					<label class="form-label">내용</label>
					<textarea rows="10" class="form-control" name="content" ><%=theaterBoard.getContent() %></textarea>
				</div>


		
				<div class="text-end">
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
					<button type="submit" class="btn btn-primary btn-sm">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>