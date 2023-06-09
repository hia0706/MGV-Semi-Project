<%@page import="java.util.List"%>
<%@page import="vo.Location"%>
<%@page import="dao.LocationDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 세션에서 로그인한 사용자 정보 가져오기
	String loginId = (String)session.getAttribute("loginId");

	// 지역정보 받아오기
	LocationDao locationDao = new LocationDao();
	List<Location> locations = locationDao.getLocations();
	
	// 자주가는 극장 정보 가져오기
	
	// 극장정보 가져오기
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
    
      .theater_detail textarea {
    width: 38.3%;
    border: none;
    resize: none;
  }
  	.list-group-item a{
  	text-decoration: none;
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
					<button type="button" class="btn btn-danger">자주가는 CGV 설정</button>
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
			    <button class="nav-link link-dark  col-md-auto" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane-<%=location.getNo() %>" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true"><%=location.getName() %></button>
			  </li>
<%
	}
%>			  
			</ul>
			<div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active" id="home-tab-pane-1" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
			  	<ul class="list-group list-group-horizontal row row-cols-4 px-3">
				  <li class="list-group-item col-3 border-start border-0 " >
				  	<a href="nothing.jsp" style="text-decoration: none;"  class="link-dark">CGV강남</a>
				  </li>
				 
				 
				</ul>
			  </div>
			  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">...</div>
			  <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>
			  <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
			</div>
			</div>
		</div>
	</div>

<div class="container">
	<div>
		<div>
			<h4>극장
			<!-- 현재 극장이 즐겨찾기에 해당하는 극장이 아니면 색상 변경 -->
			<i class="bi bi-heart-fill text-muted"></i>
			</h4>
		</div>
		<div class="theater_detail text-center">
			<img alt="대학로" src="../images/theater1.jpg">
			<div>
				<textarea class="bg-dark p-2 text-white bg-opacity-75" rows="10" cols="30" disabled="disabled">2222222233333333334</textarea>
				<textarea class="bg-dark p-2 text-white bg-opacity-75" rows="10" cols="30" disabled="disabled"></textarea>
			</div>
		</div>
		<div class="mx-auto" style="width: 500px;">
			<div class="btn-group">
			  <a href="" class="btn btn-danger active" aria-current="page">위치안내</a>
			  <a href="" class="btn btn-danger">관람가격안내</a>
			  <a href="" class="btn btn-danger">무엇무엇안내</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>