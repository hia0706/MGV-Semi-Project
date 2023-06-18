<%@page import="dao.NoticeDao"%>
<%@page import="vo.Notice"%>
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
	
	// 공지사항 최근 5개 가져오기
	NoticeDao noticeDao = NoticeDao.getInstance();
	
	List<Notice> noticeList = noticeDao.getNotice(1, 5);
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
				
				let htmlContents = "<option value='0' selected disabled>지점을 선택해주세요</option>";
				arr.forEach(function(item, index) {
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
		    getftList()

	};
	// 자주가는 극장 관리 버튼을 누르면 실행
	let ftList = [];
	let curList = [];
	// 자주가는 극장 리스트를 보여준다.
	function fTControl(){
		refreshFT(ftList);
		curList = saveList(ftList);
	}
	function saveList(ftList) {
		curList = [];
		ftList.forEach(function (item,index) {
			curList.push(item);
		})
		return curList;
	}
	// 자주가는 극장 리스트를 가져오는 ajax
	function getftList() {
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4){
				let text = xhr.responseText;
				let arr = JSON.parse(text);
				arr.forEach(function(item, index) {
					let no =item.theater.no;
					let name = item.theater.name;
					ftList.push({no,name});
				});
			}
		};
		xhr.open("GET", "view.jsp");
		xhr.send(null);
		
	}
	// 화면을 갱신해서 보여준다.
	function refreshFT(ftList) {
		let contents=""
		let circles = document.querySelectorAll(".theater-choice-list .bg .circle");
		for(index=0;index<=2;index++){
			circles[index].innerHTML = contents;
		}	
		ftList.forEach(function (item,index) {
			contents=`<p class="txt">\${item.name}</p>
      		<button type="button" class="del" onclick="deleteFT(\${index})">삭제</button>`;
      		circles[index].innerHTML = contents;
		});
	}
	// 자주가는 극장 목록에서 선택된 하나는 지우고 화면을 다시 호출한다.
	function deleteFT(number) {
		
		let no= number;
		curList.splice(no,1);
		refreshFT(curList);
	}
	// 자주가는 극장 리스트에 극장 하나는 추가하고 화면을 다시 호출한다.
	function insertFT() {
		// 진행상황 확인용 변수선언
		let passed =true;
		// 자주가는 극장이 3개이상인가.
		if(curList.length>=3){
			alert("자주가는 극장은 최대 3개까지 등록 할 수 있습니다.");
			passed = false;
			return passed;
		}
		// 극장 번호 가져오기
		let no = document.getElementById("areaList").value;
		// 극장을 선택했는지 검사
		if(no==0){
			alert("극장을 선택해주세요.");
			passed = false;
			return passed;
		}
		// 중복검사
		curList.forEach(function (item,index) {
			if(item.no==no){
				alert("이미 선택한 극장입니다. 다시 선택해주세요.");
				passed = false;
				return passed;
			}
		})
		// 극장 이름 가져오기
		let index = document.getElementById("areaList").selectedIndex;
		let name = document.getElementById("areaList").options[index].textContent;
		// ftList에 넣기
		if(passed){
			curList.push({no,name});
			// 화면 다시 호출하기
			refreshFT(curList);	
		}
	}
	// 자주가는 극장 일괄등록
	function insertFTList() {
		let arr = JSON.stringify(curList);
		let xhr = new XMLHttpRequest();
		console.log(arr);
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4){
				
			}
		};
		xhr.open("POST", "insert.jsp");
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.send(arr);
		window.location.reload();
	}
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
				<span class="s1" ><%=loginId!=null? loginId+"님":"나" %>의 자주가는극장</span>
<%
	if(loginId==null){
		
%>
				<button style="border-radius: 10px; margin-left: 10px;" onclick="login()">로그인하기</button>
<script type="text/javascript">
	function login() {
		window.location="../member/login/form.jsp";
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
				<button type="button" class="btn-sm btn-light btn-jj" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
					onclick="fTControl()">
				  자주가는 극장 관리
				</button>
<%
	}
%>				
			</div>	
			</div>
			
			<div class="part-title" style="overflow: hidden;">
				<h3 class="tit" style="float: left;">극장 공지사항</h3>
				<a href="../center/notice/list.jsp" class="text-black text-decoration-none"  style="float: right;" title="극장 공지사항 더보기">
				더보기 </a>
			</div>
			<div class="table-wrap">
				<table class="board-list">
				<colgroup style="user-select: auto;">
						<col style="width: 150px; user-select: auto;">
						<col style="width: 150px; user-select: auto;">
						<col style="user-select: auto;">
						<col style="width: 120px; user-select: auto;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">지역</th>
						<th scope="col">극장</th>
						<th scope="col">제목</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
<% for (Notice notice : noticeList) { %>				
				
					<tr>
						<td><%=notice.getLocation().getName() %></td>
						<td><%=notice.getTheater().getName() %></td>
						<td style="text-align:left">
							<a href="../center/notice/detail.jsp?no=<%=notice.getNo() %>" class="text-black text-decoration-none">
								<%=notice.getTitle() %>
							</a>
						</td>
						<td><%=notice.getCreateDate() %></td>
					</tr>

<% } %>	
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
		            	<option value="0" selected disabled>지역을 선택해주세요.</option>
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
		            	<option value="0"  selected disabled="disabled">지점을 선택해주세요</option>
		            </select>
	            </div>
	            <button id="btn-insert" type="button" class="button gray small ml05" onclick="insertFT()">추가</button>
			</div>					            
	      	<div class="theater-choice-list row">

	                     
	                          
              
				<div class="bg col-4">
	            	<div class="circle">
	                </div>
				</div>
				<div class="bg col-4">
	            	<div class="circle">
	                </div>
				</div>
				<div class="bg col-4">
	            	<div class="circle">
	                </div>
				</div>
	               
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="insertFTList()">등록</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal -->
</body>
</html>