<%@page import="vo.Location"%>
<%@page import="dao.LocationDao"%>
<%@page import="vo.Notice"%>
<%@page import="dao.NoticeDao"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);

	LocationDao locationDao = LocationDao.getInstance();
	List<Location> locationList = locationDao.getLocations();

	NoticeDao noticeDao = NoticeDao.getInstance();
	int totalRows = noticeDao.getTotalRows();
	
	Pagination pagination = new Pagination(pageNo, totalRows);

	List<Notice> noticeList = noticeDao.getNotice(pagination.getBegin(), pagination.getEnd());

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


<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="fs-2 p-2">공지사항</h1>
      	</div>
   	</div>
	<div class="clearfix">
		<ul class="dot-list">
			<li>
				<a href="insertform.jsp" class="btn btn-outline-dark btn-xs" style="float:right;">등록</a>
				공지사항을 등록하세요.
				<br>
			</li>
		</ul>
			
			
<%-- 공지사항의 글 수 --%>	
				<div class="board-list-util">
					<p class="result-count"><strong>전체 <span id="total-rows" class="font-gblue"><%=totalRows %></span>건</strong></p>
				</div>
				
<%-- 지역/극장을 선택하는 select --%>
				<select id="location" title="지역 선택" class="selectpicker" name="locationNo" onchange="refreshTheater();">
					<option value="" selected disabled>지역 선택</option>
					
<% for(Location location : locationList) { %>
				<option value="<%=location.getNo() %>"><%=location.getName() %></option>
<% } %>
				
				</select>	
				
				<select id="theater" title="극장 선택" class="selectpicker ml07" name="theaterNo" onchange= "refreshNotice();">
					<option value="" selected disabled>극장 선택</option>
				</select>		
			
			<table class="table" id="table-Notice">
				<thead>
					<tr class="table-light" > 
						<th style="width: 5%;">번호</th>
						<th style="width: 10%;">극장</th>
						<th style="width: 50%;">제목</th>
						<th style="width: 10%;">등록일</th>
					</tr>
				</thead>
				<tbody>
	
<% for (Notice notice : noticeList) { %>				
				
					<tr>
						<td><%=notice.getNo() %></td>
						<td><%=notice.getTheater().getName() %></td>
						<td style="text-align:left">
							<a href="detail.jsp?no=<%=notice.getNo() %>" class="text-black text-decoration-none">
								<%=notice.getTitle() %>
							</a>
						</td>
						<td><%=notice.getCreateDate() %></td>
					</tr>

<% } %>				
					
				</tbody>
			</table>
			
			<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item <%=pageNo <= 1 ? "disabled" : "" %>">
					<a href="list.jsp?page=<%=pageNo - 1 %>" class="page-link">이전</a>
				</li>
				
<% for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) { %>					
				
				<li class="page-item <%=pageNo == num ? "active" : "" %>">
					<a href="list.jsp?page=<%=num  %>" class="page-link"><%=num %></a>
				</li>
				
<% } %>					
				
				<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : "" %>">
					<a href="list.jsp?page=<%=pageNo + 1 %>" class="page-link">다음</a>
				</li>
			</ul>
		</nav>
		
			
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
		refreshNotice(pageNo)
	}
	
	function refreshNotice(pageNo) {
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
				let notices = obj.noticeList;
				let pagination = obj.pagination;
				
				let htmlContents = ``;
				notices.forEach(function(item, index) {
					htmlContents += `
						<tr>
							<td>\${item.no}</td>
							<td>\${item.location.name}</td>
							<td>\${item.title}</td>
							<td>\${item.createDate}</td>
						</tr>
					`;
				});
				
				document.querySelector("#table-Notice tbody").innerHTML = htmlContents;
				
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
					
			}
		};
		xhr.open("GET", "notice.jsp?no=" + theaterNo + "&page=" + pageNo);
		xhr.send(null);
	}

</script>
</body>
</html>


