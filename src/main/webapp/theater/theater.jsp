<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko" >
<head>
    
<title>
	영화 그 이상의 감동. MGV
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>

    .bi-heart-fill{
        font-size: 22px;
        line-height: 22px;
        color:crimson;
    }

</style>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="극장"/>
</jsp:include>

<div class="container">
	<div class="theater_wrap">
		<div class="sect-favorite">
			<table class="table table-dark">
				<tr>
					<td>자주가는극장</td>
					<td>
						<ul class="list-group list-group-horizontal">
						  <li class="list-group-item">An item</li>
						  <li class="list-group-item">A second item</li>
						  <li class="list-group-item">A third item</li>
						  <li class="list-group-item">A 4 item</li>
						  <li class="list-group-item">A 5 item</li>
						</ul>
					</td>
					<td>
					<button type="button" class="btn btn-dark">자주가는 CGV 설정</button>
					</td>
				</tr>
			</table>			
		</div>
		<div class="sect-city" >
		<ul style="user-select: auto;">
			<li class="on" style="user-select: auto;">
				<a href="#" style="user-select: auto;">서울</a>
					<div class="area" style="user-select: auto;">
						<ul class="list-group list-group-horizontal ">
						  <li class="list-group-item">
						  <a>An item</a>
						  </li>
						  <li class="list-group-item">
						  <a>An item</a>
						  </li>
						  <li class="list-group-item">
						  <a>An item</a>
						  </li>
						  <li class="list-group-item">
						  <a>An item</a>
						  </li>
						  <li class="list-group-item">
							<a title="CGV강남" href="/theaters/?areacode=01&amp;theaterCode=0056&amp;date=20230607" style="user-select: auto;">CGV강남</a>
						  </li>
					
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="container">
	<div>
		<div>
			<h4>극장</h4>
			<i class="bi bi-heart-fill"></i>
			<i class="bi bi-heart"></i>
		</div>
		<div class="theater_detail text-center bg-dark p-2 text-white bg-opacity-75">
			<img alt="대학로" src="../images/theater1.jpg">
			<div >...</div>
		</div>
	</div>
</div>
</body>
</html>