<%@page import="vo.Theater"%>
<%@page import="dao.TheaterDao"%>
<%@page import="vo.Location"%>
<%@page import="dao.LocationDao"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.Member"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	
	//세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	if (member == null) {
		response.sendRedirect("../../member/login/form.jsp?err=req&job="+URLEncoder.encode("문의글 등록", "utf-8"));
		return;
	}
	
	LocationDao locationDao = LocationDao.getInstance();
	List<Location> locationList = locationDao.getLocations();
	
	TheaterDao theaterDao = TheaterDao.getInstance();
	List<Theater> theaterList = theaterDao.getAllTheaters();

%>

<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	.btn.btn-sm {--bs-btn-padding-y: .40rem; --bs-btn-padding-x: .7rem; --bs-btn-font-size: .95rem; width: 100px;}
	
	
</style>
</head>
<body>


<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>

<div class="container mt-3">
	<div class="row">
		<div class="col-3">
			<div class="card">
       	  		<div class="card-header text-center" >고객센터</div>
    		
            		<div class="list-group">
  <a href="../home.jsp" class="list-group-item list-group-item-action">고객센터 홈</a>
  <a href="list.jsp" class="list-group-item list-group-item-action">분실물 문의</a>
  <a href="../oneonone/insertform.jsp" class="list-group-item list-group-item-action">1:1 문의</a>
  <a href="../faq/list.jsp" class="list-group-item list-group-item-action">자주 묻는 질문</a>
  <a href="../notice/list.jsp" class="list-group-item list-group-item-action">공지사항</a>
					</div>
					</div>
		</div>
    	<div class="col-9">
        	<h1 class="fs-2 p-2">분실물 문의</h1>
      	<div>
		<ul class="dot-list">
			<li>
				MGV에서 잃어버린 물건이 있다면 ‘분실물 문의/접수’를 통해 접수해주세요.
			</li>
			<li>접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.</li>
		</ul>
			
				<div class="border bg-light p-3">
				<form id="lostitem" class="row g-3" method="post" action="insert.jsp" >
	 				
	 									<div class="col-md-6">
						<label class="form-label">지역</label>
						<select class="form-select" name="locationNo" id="locationNo" onchange="refreshTheater();">
							<option value="" selected disabled>지역 선택</option>
							
<% for (Location location : locationList) { %>							

							<option value="<%=location.getNo() %>"><%=location.getName() %></option>

<% } %>							
							
						</select>
					</div>
					
					<div class="col-md-6">
						<label class="form-label">극장</label>
						<select class="form-select" name="theaterNo" id="theaterNo">
							<option value="" selected disabled>극장 선택</option>
						</select>
					</div>
	 				
	 				<div class="col-md-6">
						<label class="form-label">이름</label>
						<input type="text" class="form-control" name="name"/>
					</div>
					<div class="col-md-6">
						<label class="form-label">연락처</label>
						<input type="text" class="form-control" name="tel"/>
					</div>
					<div class="col-md-12">
						<label class="form-label">이메일</label>
						<input type="text" class="form-control" name="email"/>
					</div>
	 				<div class="col-md-12">
						<label class="form-label">제목</label>
						<input type="text" class="form-control" name="title"/>
					</div>
	  				<div class="col-md-12">
						<label class="form-label">내용</label>
						<textarea rows="10" class="form-control" name="content"></textarea>
					</div>
					
					
				</form>
			</div>
			<div style="text-align: center; padding:30px;">
				<button type="button" class="btn btn-secondary btn-sm" onclick="formsubmit()">등록</button>
			</div>
			</div>
		</div>	
	</div>
</div>
<script type="text/javascript">
	function formsubmit() {
		
		let insertform = document.getElementById("lostitem");
		insertform.submit();
	}	
	
	function refreshTheater() {
		// select 박스에서 선택된 값 조회하기
		let locationNo = document.getElementById("locationNo").value;
		
		// ajax 통신하기
		// 1. XMLHttpRequest 객체 생성하기
		let xhr = new XMLHttpRequest();
		
		// 2. XMLHttpRequest 객체에서 onreadystatechange 이벤트가 발생할 때 마다 실행할 함수 저장
		xhr.onreadystatechange = function() {  // 4번 울리는 진동벨이다
	
			if (xhr.readyState === 4) {  // 진동벨이 4일때만 받으러간다.				
				// 1. 응답 데이터 조회하기
				let data =  xhr.responseText; 
				// 2. 응답데이터(텍스트)를 객체(자바스크립트 객체 호은 배열객체)로 변환하기
				let arr = JSON.parse(data);	
				// 3. 응답데이터로 html컨텐츠 생성하기s
				let htmlContent = "<option value='' selected disabled>극장 선택</option>";
				arr.forEach(function(item, index) {
					// item -> {id:100, name:"기술부"};
					let theaterNo = item.no;
					let theaterName = item.name;
					
					htmlContent += `<option value="\${theaterNo}"> \${theaterName}</option>`;
				});
				// 4. 화면에 html 컨텐츠 반영시키기
				document.getElementById("theaterNo").innerHTML = htmlContent;
			}
		}
		// 2. XMLHttpRequest 객체 초기화하기(요청방식, 요청URL 지정)
		xhr.open("GET", "location.jsp?no=" + locationNo);
		// 3. 서버로 요청 보내기
		xhr.send(null);
	}
</script>
</body>
</html>









