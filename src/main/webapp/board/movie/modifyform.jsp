<%@page import="vo.MovieBoard"%>
<%@page import="vo.Movie"%>
<%@page import="dao.MovieBoardDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	// 세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");
	
	if(loginId == null){
		response.sendRedirect("../../member/loginform.jsp?err=req&job=" + URLEncoder.encode("게시물수정", "utf-8"));
		return;
	}

	
	int boardNo = Integer.parseInt(request.getParameter("no"));
	
	// 영화 제목 셀렉트 박스 목록
	MovieBoardDao movieBoardDao = MovieBoardDao.getInstance();
	List<Movie> movies = movieBoardDao.getMovies();



	// 조회된 게시물 번호로 게시물을 조회한다
	MovieBoard savedMovieBoard = movieBoardDao.getMovieBoardByBoardNo(boardNo);
	
	// 해당 게시물의 작성자가 아닌 다른 사용자가 게시물을 수정하려 했을 때 에러메세지를 출력한다.
	if (!savedMovieBoard.getMember().getId().equals(loginId)){
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id&job="+URLEncoder.encode("수정", "utf-8"));
	} 
	
	int movieNo = savedMovieBoard.getMovie().getNo();
	String grade = savedMovieBoard.getGrade();
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
         	<h1 class="border bg-light fs-4 p-2">게시글 수정폼</h1>
      	</div>
	</div>  
	<div class="row mb-3">
		<div class="col-12">
			<p>제목과 내용을 입력하세요</p>		
			<form class="border bg-light p-3" method="post" action="modify.jsp" >
				<input type="hidden" name="no" value="<%=boardNo %>">
				<div class="form-group mb-2">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="name" value="<%=savedMovieBoard.getName() %>"/>
				</div>

				<div class="txc-textbox" style="background-color:#FAFAFA; border:#FFFFFF 4px solid; border-radius: 5px; width: 33%; padding:10px; float: left;" >
					<label class="form-label">별점은 변경하실 수 없습니다.</label>
					<p>별점 : <%=score %></p>
				</div>				
								
				<div class="form-group mb-2" style="float: left; width: 33%; padding:10px;">
					<label class="form-label" >영화제목</label>
								<select class="form-select" name="movieNo" id="MovieNo" >
									<option value= 0 selected disabled>제목 선택</option>
<%
	for (Movie movie : movies){
%>
									<option value="<%=movie.getNo() %>"<%=movie.getNo() == movieNo ? "selected" : ""%> ><%=movie.getTitle() %></option>
<%
	}
%>
								</select>
				</div>				
				<br>
				<br>
				<br>
				<br>
				<br>
				
				<div class="form-group mb-2">
					<label class="form-label">내용</label>
					<textarea rows="10" class="form-control" name="content" ><%=savedMovieBoard.getContent() %></textarea>
				</div>


		
				<div class="text-end">
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
					<button type="submit" class="btn btn-primary btn-sm" onclick="null();">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>