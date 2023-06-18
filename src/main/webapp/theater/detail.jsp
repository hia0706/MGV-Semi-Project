<%@page import="vo.FavoriteTheater"%>
<%@page import="java.util.List"%>
<%@page import="dao.FavoriteTheaterDao"%>
<%@page import="vo.Theater"%>
<%@page import="dao.TheaterDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//세션에서 로그인한 사용자 정보 가져오기
	String loginId = (String)session.getAttribute("loginId");

	// 파라미터 극장번호
	int theaterNo = Integer.parseInt(request.getParameter("no"));
	
	// 오류코드 검증. 즐찾3개 넘으면 경고창. 이미 등록한 극장이면 경고창.
	
	
	// 극장번호로 극장정보 가져오기
	TheaterDao theaterDao = TheaterDao.getInstance();
	Theater theater = theaterDao.getTheaterByNo(theaterNo);
	String ad = theater.getAddress();
	
	// 자주가는 극장 정보 가져오기
	FavoriteTheaterDao fTheaterDao = FavoriteTheaterDao.getInstance();
	FavoriteTheater favoriteTheater = fTheaterDao.getFavoriteTheaterByKey(loginId, theaterNo);
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=683b3934429366d7f2da0e2094630435&libraries=services,clusterer,drawing"></script>
<!-- 카카오맵api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=683b3934429366d7f2da0e2094630435"></script>

<style>
	body{
    box-sizing: border-box;
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    font-family: sans-serif;
	}
	h2{
	font-size: 22px;
	}
	
	.bi-heart-fill{
	font-size: 22px;
	line-height: 22px;
	color:crimson;
	}
	.container{
	width: 980px;
	}
	.table-fee{
    letter-spacing: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
    text-align: center!important;
	}
	.table-fee thead{
	border-top: 1px solid gray;
	}
	.table-fee thead th {
    border-right: 1px solid #eaeaea;
    border-bottom: 1px solid #eaeaea;
    background-color: #f7f8f9;
	}
	.table-fee 	tbody td {
    border-right: 1px solid #eaeaea;
    border-bottom: 1px solid #eaeaea;
	}
	.table-fee tbody th {
    vertical-align: middle;
    border-right: 1px solid #eaeaea;
    border-bottom: 1px solid #eaeaea;
    }
    .table-fee th{
    padding-top: 10px;
    padding-bottom: 10px;
    }

</style>
</head>

<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="극장"/>
</jsp:include>
<div class="container">
	<div>
		<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a class="text-black text-decoration-none" href="theaters.jsp">전체극장</a></li>
		    <li class="breadcrumb-item active" aria-current="page"><%=theater.getName() %></li>
		  </ol>
		</nav>
		<div class="theater-cont-lab">
			<h2><%=theater.getName() %>
			<!-- 현재 극장이 즐겨찾기에 해당하는 극장이 아니면 색상 변경 text-muted를 지운다. -->
<%
	if(loginId!=null){
%>			
			<i  onclick="fn1(event)" class="bi bi-heart-fill <%=favoriteTheater!=null&&theaterNo==favoriteTheater.getTheater().getNo()?"":"text-muted" %>"></i>
<%
	}
%>			
			</h2>
		</div>
<script type="text/javascript">
// 즐겨찾기 등록된 극장인지 확인
// 안되어있으면 등록할지 확인
// 되어있으면 취소할지 확인
function fn1(e) {
	  let cur = e.currentTarget;
	  let doDelete = 'Y'; // 삭제여부 기본값 y
	  if(cur.classList.contains('text-muted')){
		  if (confirm("등록하시겠습니까?")) {
			 	doDelete = 'N';
			  } else {
			    // 취소
			    return;
			  } 
	  }else{
		  if (confirm("취소하시겠습니까?")) {
			    // 확인
			  	doDelete = 'Y'; 
			  } else {
			    // 취소
			    return;
			  } 
	  }
	  if(doDelete =='Y'){
		  window.location="favoriteTheaterDelete.jsp?no=<%=theaterNo%>";
	  }else if(doDelete =='N'){
		  window.location="favoriteTheaterInsert.jsp?no=<%=theaterNo%>";
	  }
}
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
			<img alt="대학로" src="../images/theater/theater1.jpg">
			<div>
				<ul class="nav nav-tabs nav-fill" style="width: 980px">
				  <li class="nav-item ">
				    <a id= "tab-menu-01" class="nav-link link-dark tab-head active" href="#tab01" title="극장정보 탭으로 이동" onclick="activeTab('01')">극장정보</a>
				  </li>
				<!--   <li class="nav-item">
				    <a id= "tab-menu-02" class="nav-link link-dark tab-head" href="#tab02" title="상영시간표 탭으로 이동"  onclick="activeTab('02')">상영?시간표?</a>
				  </li> -->
				  <li class="nav-item">
				    <a id= "tab-menu-03" class="nav-link link-dark tab-head" href="#tab03" title="관람료 탭으로 이동"  onclick="activeTab('03')">관람료</a>
				  </li>
				</ul>
			</div>
		</div>
		<div class="tab-cont-wrap">
			<div id="tab-01" class="tab-cont " style="display: block;">
				<div class="theater-info-text">
				</div>
				<h2 class="">시설안내</h2>
				<h3>보유시설</h3>				
				<h3>층별안내</h3>
				<h2>교통안내</h2>
				<!-- 카카오지도 보여줄 영역 -->
				<div id="map" class="float-start" style="width:400px;height:300px;">
				</div>
<!-- 카카오맵 -->				
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(37.5642135, 127.0016985), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var places = new kakao.maps.services.Places();
	var geocoder = new kakao.maps.services.Geocoder();
	
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch('<%=ad %>', function(result, status) {
	
	// 정상적으로 검색이 완료됐으면 undifined
	
	 if (status === kakao.maps.services.Status.OK) {
	
		 
		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		var lat = result[0].y; // 위도
		var lng = result[0].x; // 경도
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=theater.getName()%></div>'
	    });
	    infowindow.open(map, marker);
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	    var name = '<%=theater.getName()%>'; 
	    var mapbtn = document.getElementById('map-btn');
		mapbtn.addEventListener("click", function() {
			window.open("https://map.kakao.com/link/to/"+name+","+lat+","+lng,
					"빠른길찾기",
			        "width=800, height=1200, top=50, left=50"
			        )
		});
	} 
	});
<!-- 카카오맵 -->
</script>	
				<div>
					<table style="margin-left: 10px">
							<tbody>
								<tr>
									<td><button id="map-btn">길찾기</button></td>
								</tr>
								<tr>
									<th>대중교통</th>
								</tr>
								<tr>
									<th>자가용</th>
								</tr>
								<tr>
									<th>주차안내</th>
								</tr>
							</tbody>
					</table>			
				</div>
			
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
				<h3>영화관람료</h3>
				<div>
					<table class="table-fee" style=" width: 980px">
						<colgroup>
							<col>
							<col style="width:25%;">
							<col style="width:25%;">
							<col style="width:25%;">
						</colgroup>
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="rowgroup" rowspan="2">월~목</th>
								<td>조조 (06:00~)</td>
								<td>10,000</td>
								<td>8,000</td>
							</tr><tr>
								<td>일반 (10:01~)</td>
								<td>14,000</td>
								<td>12,000</td>
							</tr>
							<tr>
								<th scope="rowgroup" rowspan="2">금~일<br>공휴일</th>
								<td>조조 (06:00~)</td>
								<td>11,000</td>
								<td>9,000</td>
							</tr>
							<tr>
								<td>일반 (10:01~)</td>
								<td>15,000</td>
								<td>13,000</td>
							</tr>
						</tbody>
					</table>
				</div>
				<span style="color:#503396"><span style="font-size:22px">요금제</span></span><br>
				<br>
				• <span style="color:#01738b">청소년 요금</span>&nbsp; 만7세~ 만18세 : 초등학생~고등학생(학생증, 교복, 청소년증, 의료보험증, 주민등록 등/초본, 그 외 청소년 확인 가능 서류)<br>
				• 48개월 미만의 경우 증빙원(예 : 의료보험증, 주민등록 초/등본 등) 지참 시에만 무료 관람 가능<br>
				<br>
				<br>
				<span style="font-size:22px "><span style="color:#503396">우대적용</span></span><br>
				<br>
				• <span style="color:#01738b">국가유공자</span>&nbsp; 현장에서 국가유공자증을 소지한 본인 외 동반 1인까지 적용<br>
				• <span style="color:#01738b">장애인</span>&nbsp; 현장에서 복지카드를 소지한 장애인[중증 (1급~3급)까지 동반 1인까지 적용 / 경증(4급~6급)은 본인에 한함]<br>
				• <span style="color:#01738b">경로</span>&nbsp; 만65세 이상 본인에 한함(신분증 확인)<br>
				• <span style="color:#01738b">미취학아동</span>&nbsp; 부모 동반한 만4세~ 만6세까지 본인(의료보험증, 주민등록 초/등본 확인)<br>
				• <span style="color:#01738b">소방종사자</span>&nbsp; 공무원증을 소지하거나 정복을 입은 소방관 본인<br>
				<br>
				<br>
				관람가격 및 시간대 운영은 극장마다 상이할 수 있습니다.
			</div>
		</div>
	</div>
</div>
</body>
</html>
