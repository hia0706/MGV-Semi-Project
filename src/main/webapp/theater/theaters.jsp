<%@page import="dao.FavoriteTheaterDao"%>
<%@page import="vo.FavoriteTheater"%>
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
	FavoriteTheaterDao fTheaterDao = FavoriteTheaterDao.getInstance();
	List<FavoriteTheater> FTList = fTheaterDao.getFavoriteTheaterById(loginId);
	
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
  	.list-group-item:hover{
  		font-weight: 700;
  	}
  	.sect-city{
  	width: 1000px;
  	border-radius: 10px;
  	border: 3px solid #686571;
  	}
  	.sect-city ul li:active{
  	background: #555;
    border: 1px solid #555;
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
	width: 1000px;
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
	.theater-choice-list .bg .circle {
    display: table-cell;
    position: relative;
    width: 90px;
    height: 90px;
    border-radius: 90px;
    vertical-align: middle;
    text-align: center;
    background-color: #ebebeb;
	}
	.theater-choice-list {
    overflow: hidden;
    margin: 0;
    padding: 20px 0 0 45px;
	}
	.box-gray.v1 {
    border-radius: 5px;
	}
	.a-c {
	    text-align: center!important;
	}
	.box-gray {
	    padding: 20px;
	    background-color: #f2f4f5;
	}
	.bootstrap-select:not(.input-group-btn), .bootstrap-select[class*=col-] {
    float: none;
    display: inline-block;
    margin-left: 0;
	}
	.sect-favorite{
	float: none;
	display: inline-block;
	margin-left: 0;
	padding: 1em;
	background-color: #f2f4f5;
	border-radius: 0 0 10px 10px;
	width: 100%;
	height: 50px;
	}
	.sect-favorite ul{
	display: inline-block;
    margin: 0 20px;
	}
	 .sect-favorite ul li{
	display: inline-block;
    padding: 0 15px;
    margin: 0 2px;
    height: 25px;
    line-height: 24px;
    border-radius: 25px;
    background-color: #fff;
	}
	a {
	text-decoration: none;
	}
	.btn-jj{
	float: right;
	border-radius: 25px;
	}
</style>

</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="극장"/>
</jsp:include>
<script type="text/javascript">
	function insert() {
		window.open("insert.jsp",
				"자주가는 극장 등록",
				"width=800, height=1200, top=50, left=50");
	}
</script>
<div class="container ">
	<div class="theater_wrap">
		<h2>전체극장</h2>
			<div class="sect-city" >
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
					  	<a href="detail.jsp?no=<%=theater.getNo() %>" style="text-decoration: none;" class="link-dark"><%=theater.getName() %></a>
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
					  	<a href="detail.jsp?no=<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
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
					  	<a href="detail.jsp?no=<%=theater.getNo() %>" style="text-decoration: none;" class="link-dark"><%=theater.getName() %></a>
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
					  	<a href="detail.jsp?no=<%=theater.getNo() %>" style="text-decoration: none;" class="link-dark"><%=theater.getName() %></a>
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
					  	<a href="detail.jsp?no=<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
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
					  	<a href="detail.jsp?no=<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
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
					  	<a href="detail.jsp?no=<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
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
					  	<a href="detail.jsp?no=<%=theater.getNo() %>" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
					  </li>
<%
		}
	}
%>				  
					</ul>				  
				  </div>
				</div>
			<div class="sect-favorite">
				<span class="s1"><%=loginId!=null? loginId+"님":"나" %>의 자주가는극장</span>
<%
	if(loginId==null){
		
%>
				<button style="border-radius: 10px; margin-left: 10px;" onclick="login()">로그인하기</button>
<script type="text/javascript">
	function login() {
		window.location="../member/loginform.jsp";
	}
</script>				
<%
	}else{
%>				
				<ul>
<%
		for(FavoriteTheater favoriteTheater:FTList){
%>
			  		<li>
			  			<a href="detail.jsp?no=<%=favoriteTheater.getTheater().getNo() %>"  class="link-dark"><%=favoriteTheater.getTheater().getName() %></a>
			  		</li>
<%
		}
%>						  
			  		<li>
			  			<a href="detail.jsp?no=1"  class="link-dark">대학로</a>
			  		</li>
			  		<li>
			  			<a href="detail.jsp?no=1"  class="link-dark">대학로</a>
			  		</li>
			  		<li>
			  			<a href="detail.jsp?no=1"  class="link-dark">대학로</a>
			  		</li>
			  		
				</ul>
				<!-- Button trigger modal -->
				<button type="button" class="btn-sm btn-light btn-jj" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				  자주가는 극장 관리
				</button>
<%
	}
%>				
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
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">자주가는 극장 관리</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="box-gray v1 a-c">
	            <div class="dropdown bootstrap-select w150px small bs3">
		            <select title="" class="w150px small" name="areaList" tabindex="-98">
			            <option value="10">서울</option>
			            <option value="30">경기</option>
			            <option value="35">인천</option>
			            <option value="45">대전/충청/세종</option>
			            <option value="55">부산/대구/경상</option>
			            <option value="65">광주/전라</option>
			            <option value="70">강원</option>
		            </select>
	            </div>
	            <div class="dropdown bootstrap-select w150px small bs3">
		            <select title="" class="w150px small" name="areaList" tabindex="-98">
		            	<option selected disabled="disabled">지점을 선택해주세요</option>
			            <option value="10">강남</option>
			            <option value="30">강남</option>
			            <option value="35">강남</option>
			            <option value="45">강남</option>
			            <option value="55">강남</option>
			            <option value="65">강남</option>
			            <option value="70">강남</option>
		            </select>
	            </div>
	            <button id="btn-insert" type="button" class="button gray small ml05">추가</button>
			</div>					            
	      	<div class="theater-choice-list row">
	               <div class="bg col-4">
	                      <div class="circle " data-brch-no="1003">
	                          <p class="txt" data-eng-nm="Dongdaemoon" data-kor-nm="동대문">동대문</p>
	                          <button type="button" class="del">삭제</button>
	                      </div>
	               </div>
	               <div class="bg col-4">
	                      <div class="circle " data-brch-no="1372">
	                          <p class="txt" data-eng-nm="Gangnam" data-kor-nm="강남">강남</p>
	                          <button type="button" class="del">삭제</button>
	                      </div>
	               </div>
	               <div class="bg col-4">
	                      <div class="circle " data-brch-no="1341">
	                          <p class="txt" data-eng-nm="Gangdong" data-kor-nm="강동">강동</p>
	                          <button type="button" class="del">삭제</button>
	                      </div>
	               </div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary">등록</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal -->
</body>
</html>