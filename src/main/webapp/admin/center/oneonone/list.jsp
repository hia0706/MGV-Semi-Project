<%@page import="vo.Location"%>
<%@page import="dao.LocationDao"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.Oneonone"%>
<%@page import="dao.OneononeDao"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	// 세션에서 로그인된 사용자 아이디 조회
	String id = (String) session.getAttribute("loginId");

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	if (member == null) {
		response.sendRedirect("../../../member/login/form.jsp?err=req&job="+URLEncoder.encode("고객센터 관리", "utf-8"));
		return;
	}
	
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	LocationDao locationDao = LocationDao.getInstance();
	List<Location> locationList = locationDao.getLocations();
	
	OneononeDao oneononeDao = OneononeDao.getInstance();
	int totalRows = oneononeDao.getTotalRows();
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	
	List<Oneonone> oneononeList = oneononeDao.getAllOneonones(pagination.getBegin(), pagination.getEnd());
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
	.btn.btn-xs {--bs-btn-padding-y: .40rem; --bs-btn-padding-x: .7rem; --bs-btn-font-size: .95rem;}
	
	table {
	   text-align: center;
	}
	
</style>
</head>
<body>


<jsp:include page="../../nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>


<div class="container mt-3">
	<div class="row">
		<div class="col-3">
			<div class="card">
       	  		<div class="card-header text-center" >고객센터</div>
    		
            		<div class="list-group">
  <a href="../home.jsp" class="list-group-item list-group-item-action">고객센터 홈</a>
  <a href="../lostitem/list.jsp" class="list-group-item list-group-item-action">분실물 문의</a>
  <a href="list.jsp" class="list-group-item list-group-item-action">1:1 문의</a>
  <a href="../faq/list.jsp" class="list-group-item list-group-item-action">자주 묻는 질문</a>
  <a href="../notice/list.jsp" class="list-group-item list-group-item-action">공지사항</a>
  <a class="list-group-item list-group-item-action disabled" style="color:gray; font-size:15px;">
  		MGV 고객센터 <br> Dream center <br><br> 10:00~19:00
  </a>
					</div>
					</div>
		</div>
    	<div class="col-9">
        	<h1 class="fs-2 p-2">전체 1:1 문의내역</h1>
   	<div>
		<ul class="dot-list">
			<li>고객들이 남긴 1:1 문의내역을 확인하세요.</li>
		</ul>
		
<%-- 공지사항의 글 수 --%>	
			<div class="board-list-util">
				<p class="result-count"><strong>전체 <span id="total-rows" class="font-gblue"><%=totalRows %></span>건</strong></p>
			</div>	
			
			<div class="d-flex justify-content-start">
<%-- 지역/극장을 선택하는 select --%>
				<select id="location" title="지역 선택" class="form-select selectpicker form-control mb-3 me-3" style="width: 150px;"name="locationNo"  name="locationNo" onchange="refreshTheater();">
					<option value="" selected disabled>지역 선택</option>
					
<% for(Location location : locationList) { %>
				<option value="<%=location.getNo() %>"><%=location.getName() %></option>
<% } %>
				
				</select>	
				
				<select id="theater" title="극장 선택" class="form-select selectpicker form-control mb-3" style="width: 150px;" name="theaterNo" onchange= "refreshOneonone();">
					<option value="" selected disabled>극장 선택</option>
				</select>	
			</div>										
			
			<table class="table border-top"  id="table-Oneonone"> 
				<thead>
					<tr class="table-light" > 
						<th style="width: 5%;">번호</th>
						<th style="width: 10%;">극장</th>
						<th style="width: 50%;">제목</th>
						<th style="width: 10%;">접수상태</th>
						<th style="width: 10%;">등록일</th>
					</tr>
				</thead>
				<tbody>
				
<% for (Oneonone oneonone : oneononeList) { %>				
				
					<tr>
						<td><%=oneonone.getNo() %></td>
						<td><%=oneonone.getTheater().getName() %></td>
						<td style="text-align:left">
							<a href="detail.jsp?no=<%=oneonone.getNo() %>" class="text-black text-decoration-none">
								<%=oneonone.getTitle() %>
							</a>
						</td>
						
<% if ("N".equals(oneonone.getAnswered())) { %>
						<td>미답변</td>
<% } else {%>
						<td>답변완료</td>
<% } %>

						<td><%=oneonone.getCreateDate() %></td>
					</tr>

<% } %>				
					
				</tbody>
			</table>
			
			<nav>
				<ul class="pagination justify-content-center">
				
<%
	if(!oneononeList.isEmpty()) {
%>				
				
					<li class="page-item <%=pageNo <= 1 ? "disabled" : "" %>">
						<a href="list.jsp?page=<%=pageNo - 1 %>" class="page-link">이전</a>
					</li>
					
<% 		for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) { %>					
					
					<li class="page-item <%=pageNo == num ? "active" : "" %>">
						<a href="list.jsp?page=<%=num  %>" class="page-link"><%=num %></a>
					</li>
					
<% 		} %>					
					
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : "" %>">
						<a href="list.jsp?page=<%=pageNo + 1 %>" class="page-link">다음</a>
					</li>
					
<% } %>					
					
				</ul>
			</nav>				
			</div>
		</div>	
	</div>
</div>
<script type="text/javascript">
	function refreshTheater() {
		// select 박스에서 선택된 값 조회하기
		let locationNo = document.getElementById("location").value;
		
		// ajax 통신하기
		// 1. XMLHttpRequest 객체 생성하기
		let xhr = new XMLHttpRequest();
		// 2. XMLHttpRequest 객체에서 onreadystatechange 이벤트가 발생할 때 마다 실행할 함수 저장
		xhr.onreadystatechange = function() {  // 4번 울리는 진동벨이다
			// console.log("readyState", xhr.readyState);
			if (xhr.readyState === 4) {  // 진동벨이 4일때만 받으러간다.				
				// 1. 응답 데이터 조회하기
				let data =  xhr.responseText;  // 순수 텍스트이다
				// data -> '[{"id":100, "name":"기술부"}, {"id":101, "name":"영업부"}]'
			
				// 2. 응답데이터(텍스트)를 객체(자바스크립트 객체 호은 배열객체)로 변환하기
				let arr = JSON.parse(data);	// arr -> [{id:100, name:"기술부"}, {id:101, name:"영업부"}]
				// 3. 응답데이터로 html컨텐츠 생성하기s
				let htmlContent = "<option value='' selected disabled>극장 선택</option>";
				arr.forEach(function(item, index) {
					// item -> {id:100, name:"기술부"};
					let theaterNo = item.no;
					let theaterName = item.name;
					
					htmlContent += `<option value="\${theaterNo}"> \${theaterName}</option>`;
				});
				// 4. 화면에 html 컨텐츠 반영시키기
				document.getElementById("theater").innerHTML = htmlContent;
			}
		}
		// 2. XMLHttpRequest 객체 초기화하기(요청방식, 요청URL 지정)
		xhr.open("GET", "location.jsp?no=" + locationNo);
		// 3. 서버로 요청 보내기
		xhr.send(null);	
	}
	
	function goPage(e, pageNo) {
		e.preventDeafault();
		refreshOneonone(pageNo)
	}
	
	function refreshOneonone(pageNo) {
		pageNo = pageNo || 1;
		// select 박스에서 선택된 값 조회하기
		let theaterNo = document.getElementById("theater").value;
		
		// ajax 요청
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4) {
				let text = xhr.responseText;
				let obj = JSON.parse(text);
				
				document.getElementById("total-rows").textContent = obj.totalRows;
				let oneonones = obj.oneononeList;
				let pagination = obj.pagination;
				
				let htmlContents = ``;
				oneonones.forEach(function(item, index) {
					htmlContents += `
						<tr>
							<td>\${item.no}</td>
							<td>\${item.theater.name}</td>
							<td style="text-align:left"><a class="text-black text-decoration-none" href="detail.jsp?no=\${item.no}">\${item.title}</a></td>
							<td>\${item.answered == 'N' ? '미답변' : '답변완료'}</td>
							
							<td>\${item.createDate}</td>
						</tr>
					`;
				});
				
				document.querySelector("#table-Oneonone tbody").innerHTML = htmlContents;
				
				if (pagination.totalRows > 0) {
					let paginationHtmlContent = `<nav>   
						<ul class="pagination justify-content-center">
						<li class="page-item \${pagination.pageNo <= 1 ?  'disabled' : ''}">
							<a href="list.jsp?page=\${pagination.pageNo -1}" onclick="goPage(event, \${pagination.pageNo -1})" class="page-link">이전</a>
						</li>`;
				
					for (let num = pagination.beginPage; num <= pagination.endPage; num++) {
						
						paginationHtmlContent += `<li class="page-item \${pagination.pageNo == num ? 'active' : ''}">
													<a href="list.jsp?page=\${num}" onclick="goPage(event, \${num})" class="page-link">\${num}</a>
												  </li>`;
	
					}
					
					paginationHtmlContent += `<li class="page-item \${pagination.pageNo >= pagination.totalRows ? 'disabled' : ''}">
												<a href="list.jsp?page=\${pagination.pageNo + 1}" onclick="goPage(event, \${pagination.pageNo + 1})" class="page-link">다음</a>
										      </li>
											</ul>
											</nav>`
					
					document.querySelector(".pagination").innerHTML = paginationHtmlContent;
				} else {
					document.querySelector("#table-Oneonone tbody").innerHTML = `
						<tr>
							<td colspan="5" class="text-center">조회결과가 존재하지 않습니다.</td>
						</tr>
					`;
					document.querySelector(".pagination").innerHTML = "";
				}	
			}
		};
		xhr.open("GET", "oneonone.jsp?no=" + theaterNo + "&page=" + pageNo);
		xhr.send(null);
	}

</script>
</body>
</html>





