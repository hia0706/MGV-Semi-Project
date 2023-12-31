<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<style type="text/css">
#wrap {
	min-height: 100vh;
	position : relative;
	width: 100%
}

footer{
	width: 100%;
	height: 350px;
	bottom: 0px;
	position: absolute;
	border-top: 1px solid #c4c4c4;
	padding-top: 15px;
	color: #808080
	font-size: 11px;
}

fotter a{
	display: inline-block;
	margin: 0 20px 10px 20px;
	color: #808080; font-size: 11px;
}

fotter a:visited{
	color: #808080;
}

fotter p{
	margin-top: 0; margin-bottom: 0;
}

fotter p span{
	display: inline-block;
	margin-left: 20px;
	font-size: 10px;

}

section {
	padding-bottom: 350px; /*footer의 height값과 동일*/
}

html. body {
	margin: 0;
	padding: 0;
}
</style>
<title>MGV 게시판관리 홈</title>
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

       <div id="wrap" style="margin: 0 auto; width: 1500px; position: relative; top: 50px;">
       <section>
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
			<a href="store/list.jsp" class="text-black text-decoration-none">
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
	</section>
	
	<footer class="footer" style="text-align: center;">
		<nav>
			<a class="text-black text-decoration-none" href="https://www.erdcloud.com/d/4nYKSKxkRtdsYwCgh"><strong>ERDCloud</strong>&nbsp</a> | 
			<a class="text-black text-decoration-none" href="https://github.com/semi-movie/MGV">&nbsp<strong>Github</strong></a>
		</nav>
		<p>
			<span><strong>TEL</strong> 0607-0620 <strong>Address</strong>서울특별시 종로구 율곡로10길 105 디아망 4층 (봉익동 10-1)</span><br/>
			<span><strong>조장</strong> 이진서 <strong>조원</strong> 신하원, 오민선, 서준호, 이재권, 진현국</span><br/>
			<span><strong>근무시간</strong>: 월 ~ 금 AM 9:00 ~ PM 6:00 |
			<strong>점심시간</strong>: PM1 :00 ~ PM 2 : 00 |
			<strong>고객센터</strong> : AM 10: 00 ~ PM 7 : 00</span>
		
		</p>
	</footer>
		

</div>


</body>
</html>