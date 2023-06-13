<%@page import="vo.Theater"%>
<%@page import="dao.TheaterDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 파라미터 극장번호
	int theaterNo = Integer.parseInt(request.getParameter("no"));

	// 극장번호로 극장정보 가져오기
	TheaterDao theaterDao = TheaterDao.getInstance();
	Theater theater = theaterDao.getTheaterByNo(theaterNo);
	String ad = theater.getAddress();
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
	.bi-heart-fill{
	font-size: 22px;
	line-height: 22px;
	color:crimson;
	}
	.container{
	width: 900px;}
</style>
</head>

<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="극장"/>
</jsp:include>
<div class="container">
	<div>
		<div class="theater-cont-lab">
			<h4>강남
			<!-- 현재 극장이 즐겨찾기에 해당하는 극장이 아니면 색상 변경 text-muted를 지운다. -->
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
				<h2>시설안내</h2>
				<h3>보유시설</h3>				
				<h3>층별안내</h3>				
				<!-- 카카오지도 보여줄 영역 -->
				<div id="map" class="float-start" style="width:400px;height:300px;">
				</div>
				
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


</script>	
				<div>
					<table style="margin-left: 10px">
							<tbody>
								<tr>
									<th>교통안내</th>
									<td><button id="map-btn">길찾기</button></td>
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