<%@page import="vo.Theater"%>
<%@page import="dao.TheaterDao"%>
<%@page import="java.util.List"%>
<%@page import="vo.Location"%>
<%@page import="dao.LocationDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 세션에서 로그인한 사용자 정보 가져오기
	String loginId = (String)session.getAttribute("loginId");

	// 지역정보 받아오기
	LocationDao locationDao = LocationDao.getInstance();
	List<Location> locations = locationDao.getLocations();
	
	// 자주가는 극장 정보 가져오기
	
	// 극장정보 가져오기
	TheaterDao theaterDao = TheaterDao.getInstance();
	List<Theater> theaterList = theaterDao.getAllTheaters(); 
	
%>
<!doctype html>
<html lang="ko" >
<head>
    
<title>
	영화 그 이상의 감동. MGV
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style>
	body {
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
	}
	.theater-list ul li {
    position: relative;
    float: left;
    width: 25%;
    line-height: 26px;
    text-align: left;
    padding-left: 40px;
	}
    .bi-heart-fill{
        font-size: 22px;
        line-height: 22px;
        color:crimson;
    }
  	.list-group-item a{
  	text-decoration: none;
  	}
  	.sect-city,.theater_wrap{
  	width: 1000px;
  	}
  	.container
  	{
  	width: 1000px;
  	padding: 0px;
  	}
	.table-wrap table{
	font-size: 12pt;
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
	}
	.table-wrap {
    position: relative;
    border-top: 1px solid #555;
    }
    h3.tit {
    margin: 0;
    padding: 0 0 16px 0;
    font-size: 1.6em;
    font-weight: 400;
    color: #503396;
    line-height: 1.1;
	}
	.board-list>thead>tr>th {
    height: 45px;
    padding: 3px 10px;
    color: #222;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    background-color: #f2f4f5;
    text-align: center;
	}
	.board-list>tbody>tr>th {
    text-align: left;
    font-weight: 400;
	}
	.board-list>tbody>tr>td, .board-list>tbody>tr>th {
    height: 45px;
    padding: 10px;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    text-align: center;
	}
	th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: internal-center;
	}
	table {
    border-collapse: separate;
    text-indent: initial;
    border-spacing: 2px;
	}
	.part-title {
	margin-top: 100px;
	}
	
}
</style>

</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="극장"/>
</jsp:include>

<div class="container ">
	<div class="theater_wrap">
		<h2>전체극장</h2>
		<div class="sect-favorite">
			<table class="table">
				<tr>
					<td class="align-middle">자주가는극장</td>
					<td>
						<ul class="list-group list-group-horizontal ">
						  <li class="list-group-item" >
						  	<a href="nothing.jsp"  class="link-dark">An item</a>
						  </li>
						  <li class="list-group-item">A second item</li>
						  <li class="list-group-item ">A third item</li>
						  <li class="list-group-item ">A 4 item</li>
						  <li class="list-group-item ">A 5 item</li>
						</ul>
					</td>
					<td>
					<button type="button" class="btn btn-danger">자주가는 극장 설정</button>
					</td>
				</tr>
			</table>			
		</div>
			<div class="sect-city border" >
				<ul class="nav nav-tabs nav-fill" id="myTab" role="tablist" >
<%
	for(Location location:locations){
%>			
				  <li class="nav-item col-md-auto" role="presentation">
				    <button class="nav-link link-dark  col-md-auto <%=location.getNo() == 1? "active":""%>" id="theater-tab" data-bs-toggle="tab" data-bs-target="#theater-tab-pane-<%=location.getNo() %>" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true"><%=location.getName() %></button>
				  </li>
<%
	}
%>			  
				</ul>
				<div class="tab-content theater-list" id="myTabContent">
				  <div class="tab-pane fade show active" id="theater-tab-pane-1" role="tabpanel" aria-labelledby="theater-1-tab" tabindex="0" >
				  	<ul class="list-group list-group-horizontal row row-cols-4 " style="margin-left: 0;">
<%
	for(Theater theater:theaterList){
		if(theater.getLocation().getNo()==1){
%>			  	
					  <li class="list-group-item col-3 border-0 " >
					  	<a href="detail.jsp?no=<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
					  </li>
<%
		}
	}
%>				  
					</ul>
				  </div>
				  <div class="tab-pane fade" id="theater-tab-pane-2" role="tabpanel" aria-labelledby="theater-2-tab" tabindex="0">
				  	<ul class="list-group list-group-horizontal row row-cols-4 " style="margin-left: 0;">
<%
	for(Theater theater:theaterList){
		if(theater.getLocation().getNo()==2){
%>			  	
					  <li class="list-group-item col-3 border-0 " >
					  	<a href="#theater-<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
					  </li>
<%
		}
	}
%>				  
					</ul>				  
				  </div>
				  <div class="tab-pane fade" id="theater-tab-pane-3" role="tabpanel" aria-labelledby="theater-3-tab" tabindex="0">
				  	<ul class="list-group list-group-horizontal row row-cols-4 " style="margin-left: 0;">
<%
	for(Theater theater:theaterList){
		if(theater.getLocation().getNo()==3){
%>			  	
					  <li class="list-group-item col-3 border-0 " >
					  	<a href="#theater-<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
					  </li>
<%
		}
	}
%>				  
					</ul>				 
				  </div>
				  <div class="tab-pane fade" id="theater-tab-pane-4" role="tabpanel" aria-labelledby="theater-4-tab" tabindex="0">
				  	<ul class="list-group list-group-horizontal row row-cols-4 " style="margin-left: 0;">
<%
	for(Theater theater:theaterList){
		if(theater.getLocation().getNo()==4){
%>			  	
					  <li class="list-group-item col-3 border-0 " >
					  	<a href="#theater-<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
					  </li>
<%
		}
	}
%>				  
					</ul>				  
				  </div>
				  <div class="tab-pane fade" id="theater-tab-pane-5" role="tabpanel" aria-labelledby="theater-5-tab" tabindex="0">
				  	<ul class="list-group list-group-horizontal row row-cols-4 " style="margin-left: 0;">
<%
	for(Theater theater:theaterList){
		if(theater.getLocation().getNo()==5){
%>			  	
					  <li class="list-group-item col-3 border-0 " >
					  	<a href="#theater-<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
					  </li>
<%
		}
	}
%>				  
					</ul>				  
				  </div>
				  <div class="tab-pane fade" id="theater-tab-pane-6" role="tabpanel" aria-labelledby="theater-6-tab" tabindex="0">
				  	<ul class="list-group list-group-horizontal row row-cols-4 " style="margin-left: 0;">
<%
	for(Theater theater:theaterList){
		if(theater.getLocation().getNo()==6){
%>			  	
					  <li class="list-group-item col-3 border-0 " >
					  	<a href="#theater-<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
					  </li>
<%
		}
	}
%>				  
					</ul>				  
				  </div>
				  <div class="tab-pane fade" id="theater-tab-pane-7" role="tabpanel" aria-labelledby="theater-7-tab" tabindex="0">
				  	<ul class="list-group list-group-horizontal row row-cols-4 " style="margin-left: 0;">
<%
	for(Theater theater:theaterList){
		if(theater.getLocation().getNo()==7){
%>			  	
					  <li class="list-group-item col-3 border-0 " >
					  	<a href="#theater-<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
					  </li>
<%
		}
	}
%>				  
					</ul>				  
				  </div>
				  <div class="tab-pane fade" id="theater-tab-pane-8" role="tabpanel" aria-labelledby="theater-8-tab" tabindex="0">
				  	<ul class="list-group list-group-horizontal row row-cols-4 " style="margin-left: 0;">
<%
	for(Theater theater:theaterList){
		if(theater.getLocation().getNo()==8){
%>			  	
					  <li class="list-group-item col-3 border-0 " >
					  	<a href="#theater-<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
					  </li>
<%
		}
	}
%>				  
					</ul>				 
				  </div>
				  <div class="tab-pane fade" id="theater-tab-pane-9" role="tabpanel" aria-labelledby="theater-9-tab" tabindex="0">
				  	<ul class="list-group list-group-horizontal row row-cols-4 " style="margin-left: 0;">
<%
	for(Theater theater:theaterList){
		if(theater.getLocation().getNo()==9){
%>			  	
					  <li class="list-group-item col-3 border-0 " >
					  	<a href="#theater-<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
					  </li>
<%
		}
	}
%>				  
					</ul>				  
				  </div>
				</div>
			</div>
			<div class="part-title">
				<h3 class="tit">극장 공지사항</h3>
			</div>
			<div class="table-wrap">
				<table class="board-list">
				<colgroup style="user-select: auto;">
						<col style="width: 150px; user-select: auto;">
						<col style="user-select: auto;">
						<col style="width: 150px; user-select: auto;">
						<col style="width: 120px; user-select: auto;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">극장</th>
						<th scope="col">제목</th>
						<th scope="col">지역</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>뭐시기극장</td>
						<th scope="row">
							<a href="/support/notice/detail?artiNo=10860&amp;bbsNo=9" title="[대전현대아울렛]영화관 재오픈 안내 상세보기" style="user-select: auto;">
												[대전현대아울렛]영화관 재오픈 안내
							</a>
						</th>
						<td>서울</td>
						<td>2023-06-12</td>
					</tr>
				</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>