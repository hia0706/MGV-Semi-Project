<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title>MGV 고객센터</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="icon" href="/mgv/images/mgv.ico" type="images/x-icon">
<style>


</style>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="게시판"/>
</jsp:include>

       <div class="col-9"  style="margin: 0 auto; width: 1500px; position: relative; top: 50px;">
    	<div class="row mb-3 bg-light p-3"> 

		<div class="col-3 text-center"  style="margin: 0 auto;">
			<a href="movie/list.jsp" class="text-black text-decoration-none">
				<img src="../../images/board/movie.png" width="100" height="100"><br>
				<strong>영화게시판 관리</strong>
			</a>		
			<br>
			<br>
			<div>
				        <a href="movie/reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a> 
				        <a href="movie/deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a>

			</div>
			
		</div>
		
		<div class="col-3 text-center"  style="margin: 0 auto;">
			<a href="theater/list.jsp" class="text-black text-decoration-none">
				<img src="../../images/board/theater.png" width="100" height="100"><br>
				<strong>극장게시판 관리</strong>
			</a>
			<br>
			<br>
			<div>
				        <a href="theater/reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a> 
				        <a href="theater/deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a>

			</div>
		</div>
		
		<div class="col-3 text-center"  style="margin: 0 auto;">
			<a href="theater/list.jsp" class="text-black text-decoration-none">
				<img src="../../images/board/store.png" width="100" height="100"><br>
				<strong>스토어게시판 관리</strong>
			</a>
			<br>
			<br>
			<div>
				        <a href="store/reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a> 
				        <a href="store/deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a>

			</div>
		</div>
		
	</div>
    </div>


</body>
</html>