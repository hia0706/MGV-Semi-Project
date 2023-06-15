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
<link rel="stylesheet" href="style.css"> <!-- 극장정보 스타일시트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style>
	
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
	function locationSelect(no) {
		// locationNo로 영화관탭생성
		let el = document.getElementById("theater-tab-"+no);
		let locNo = no;
		let htmlContent ="<div class='tab-pane fade show active' id='theater-tab-pane-"+locNo+"' role='tabpanel' aria-labelledby='theater-"+locNo+"-tab' tabindex='0' ><ul class='list-group list-group-horizontal row row-cols-4' style='margin-left: 0;'></ul></div>";
		document.querySelector("#myTabContent").innerHTML=htmlContent;
		theaterTab(locNo);
	}

	function theaterTab(no) {
		// select 박스에서 선택된값 조회하기
		let locNo = no;
		
		// ajax 요청
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4){
				let text = xhr.responseText;
				let arr = JSON.parse(text);
				
				let htmlContents = "";
				arr.forEach(function(item, index) {
					console.log(item.id);
					htmlContents += `
						<li class="list-group-item col-3 border-0 " >
						<a href="detail.jsp?no=\${item.no}" style="text-decoration: none;"  class="link-dark">\${item.name}</a>
						</li>
					`;
				});
				
				document.querySelector("#theater-tab-pane-"+locNo+" ul").innerHTML = htmlContents;
			}
		};
		xhr.open("GET", "theaterTab.jsp?no="+locNo);
		xhr.send(null);
	}
	//
	function refreshTheaters() {
		// select 박스에서 선택된값 조회하기
		let locNo = document.getElementById("locationList").value;
		
		// ajax 요청
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4){
				let text = xhr.responseText;
				let arr = JSON.parse(text);
				
				let htmlContents = "<option selected disabled>지점을 선택해주세요</option>";
				arr.forEach(function(item, index) {
					console.log(item.id);
					htmlContents += `
			            <option value="\${item.no}">\${item.name}</option>
					`;
				});
				
				document.querySelector("#areaList").innerHTML = htmlContents;
			}
		};
		xhr.open("GET", "theaterTab.jsp?no="+locNo);
		xhr.send(null);
	}
	
	/* 처음 페이지가 로드되면 실행. */
	window.onload = function() { // window.addEventListener('load', (event) => {와 동일합니다.
		    locationSelect(1);

	};
	

</script>
<div class="container ">
	<div class="theater_wrap">
		<h2 class="tit">전체극장</h2>
			<div class="sect-city" >
				<ul class="nav nav-tabs nav-fill" id="myTab" role="tablist" >
<%
	for(Location location:locations){
%>			
					<li class="nav-item col-md-auto" role="presentation">
				    	<button class="nav-link link-dark  col-md-auto <%=location.getNo() == 1? "active":""%>" id="theater-tab-<%=location.getNo() %>" data-bs-toggle="tab" 
				    		data-bs-target="#theater-tab-pane-<%=location.getNo() %>" type="button" role="tab" 
				    		aria-controls="home-tab-pane" aria-selected="true" onclick="locationSelect(<%=location.getNo() %>);" value="<%=location.getNo() %>">
				    		<%=location.getName() %>
				    	</button>
					</li>
<%
	}
%>			  
				</ul>
				<div class="tab-content theater-list" id="myTabContent">
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
		            <select id="locationList" class="w150px small" name="locationList" tabindex="-98" onchange="refreshTheaters();">
		            	<option value="" selected disabled>지역을 선택해주세요.</option>
<%
	for(Location location:locations){
%>		            
			            <option value="<%=location.getNo()%>"><%=location.getName()%></option>
<%
	}
%>			            
		            </select>
	            </div>
	            <div class="dropdown bootstrap-select w150px small bs3">
		            <select id="areaList" class="w150px small" name="areaList" tabindex="-98">
		            	<option selected disabled="disabled">지점을 선택해주세요</option>
		            </select>
	            </div>
	            <button id="btn-insert" type="button" class="button gray small ml05">추가</button>
			</div>					            
	      	<div class="theater-choice-list row">
<%
	for(FavoriteTheater fTheater:FTList){
%>	      	
	               <div class="bg col-4">
	                      <div class="circle " data-brch-no=<%=fTheater.getTheater().getNo() %>>
	                          <p class="txt" data-eng-nm="Dongdaemoon" data-kor-nm="<%=fTheater.getTheater().getName() %>"><%=fTheater.getTheater().getName() %></p>
	                          <button type="button" class="del">삭제</button>
	                      </div>
	               </div>
<%
	}
%>	               
	               
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