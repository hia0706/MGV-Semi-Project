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
	table{
	font-size: 12pt;
	}
</style>
</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="극장"/>
</jsp:include>

<div class="container ">
	<div class="theater_wrap">
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
				<ul class="nav nav-tabs " id="myTab" role="tablist" >
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
				<div class="tab-content" id="myTabContent">
				  <div class="tab-pane fade show active" id="theater-tab-pane-1" role="tabpanel" aria-labelledby="theater-1-tab" tabindex="0" >
				  	<ul class="list-group list-group-horizontal row row-cols-4 " style="margin-left: 0;">
<%
	for(Theater theater:theaterList){
		if(theater.getLocation().getNo()==1){
%>			  	
					  <li class="list-group-item col-3 border-0 " >
					  	<a href="nothing.jsp" style="text-decoration: none;"  class="link-dark"><%=theater.getName() %></a>
					  </li>
<%
		}
	}
%>				  
					</ul>
				  </div>
				  <div class="tab-pane fade" id="theater-tab-pane-2" role="tabpanel" aria-labelledby="theater-2-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="theater-tab-pane-3" role="tabpanel" aria-labelledby="theater-3-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="theater-tab-pane-4" role="tabpanel" aria-labelledby="theater-4-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="theater-tab-pane-5" role="tabpanel" aria-labelledby="theater-5-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="theater-tab-pane-6" role="tabpanel" aria-labelledby="theater-6-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="theater-tab-pane-7" role="tabpanel" aria-labelledby="theater-7-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="theater-tab-pane-8" role="tabpanel" aria-labelledby="theater-8-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="theater-tab-pane-9" role="tabpanel" aria-labelledby="theater-9-tab" tabindex="0">...</div>
				</div>
			</div>
		</div>
	</div>

<div class="container">
	<div>
		<div>
			<h4>강남
			<!-- 현재 극장이 즐겨찾기에 해당하는 극장이 아니면 색상 변경 -->
			<i class="bi bi-heart-fill text-muted"></i>
			</h4>
		</div>
<script type="text/javascript">
<!-- theater_detail클래스에 속한 ul에 속한 a태그를 누르면 tab-cont-wrap에 href에 해당하는 div를 보이게 하고 다른 것들은 안보이게 바꾼다.-->
function activeTab(num) {
	let tabContents = document.querySelectorAll(".tab-cont");
	let tabHeads = document.querySelectorAll(".tab-head");
	tabHeads.forEach(function(el) {
		el.classList.remove("active");
	}) 
	tabContents.forEach(function(el) {
		el.style.display = "none";
	})
	document.getElementById("tab-menu-"+num).classList.add("active");
	document.getElementById("tab-"+num).style.display = "block";
}
</script>		
		<div class="theater_detail ">
			<img alt="대학로" src="../images/theater1.jpg">
			<div>
				<ul class="nav nav-tabs nav-fill ">
				  <li class="nav-item ">
				    <a id= "tab-menu-01" class="nav-link link-dark tab-head active" href="#tab01" title="극장정보 탭으로 이동" onclick="activeTab('01')">극장정보</a>
				  </li>
				  <li class="nav-item">
				    <a id= "tab-menu-02" class="nav-link link-dark tab-head" href="#tab02" title="상영시간표 탭으로 이동"  onclick="activeTab('02')">상영시간표</a>
				  </li>
				  <li class="nav-item">
				    <a id= "tab-menu-03" class="nav-link link-dark tab-head" href="#tab03" title="관람료 탭으로 이동"  onclick="activeTab('03')">관람료</a>
				  </li>
				</ul>
			</div>
		</div>
		<div class="tab-cont-wrap">
			<div id="tab-01" class="tab-cont" style="display: block;">
				<table style="margin-left: 10px">
						<tbody>
							<tr>
								<th>공지사항1</th>
							</tr>
						</tbody>
				</table>
			</div>
			<div id="tab-02" class="tab-cont" style="display: none;">
				<table style="margin-left: 10px">
						<tbody>
							<tr>
								<th>공지사항2</th>
							</tr>
						</tbody>
				</table>
			</div>
			<div id="tab-03" class="tab-cont" style="display: none;">
				<table style="margin-left: 10px">
						<tbody>
							<tr>
								<th>공지사항3</th>
							</tr>
						</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>