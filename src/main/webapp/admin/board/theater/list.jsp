<%@page import="java.net.URLEncoder"%>
<%@page import="dao.TheaterDao"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="vo.TheaterBoard"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="dao.TheaterDao"%>
<%@page import="vo.Theater"%>
<%@page import="vo.Location"%>
<%@page import="java.util.List"%>
<%@page import="dao.LocationDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<%
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	LocationDao locationDao = LocationDao.getInstance();
	List<Location> locations = locationDao.getLocations();
	
	TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
	int totalRows = theaterBoardDao.getTotalRows();
//	theaterBoardDao.getTotalRowsByLocation(locationNo);
//	theaterBoardDao.getTotalRowsByTheater(theaterNo);
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	
	// 데이터 조회하기
	List<TheaterBoard> theaterBoards = theaterBoardDao.getTheaterBoards(pagination.getBegin(), pagination.getEnd());

	// 세션에서 로그인된 사용자 정보 조회하기
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");	

	// 에러메세지 출력
	if(loginId == null){
		response.sendRedirect("../../../member/login/form.jsp?err=req&job=" + URLEncoder.encode("게시판 관리", "utf-8"));
		return;
	}
	
	if (!"ADMIN".equals(loginType)) {
		response.sendRedirect("../../../board/theater/list.jsp?err=type");
		return;
	}
%>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>게시글 목록 | 극장 &#60; 관리자</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

<jsp:include page="../../nav.jsp">
	<jsp:param name="menu" value="극장"/>
</jsp:include>

<div class="container mt-3">
	<div class="row">
		<div class="col-3">
			<div class="card">
       	  		<div class="card-header text-center" ><strong>게시판관리</strong></div>
            		<div class="list-group">
    				  <a href="../home.jsp" class="list-group-item list-group-item-action">게시판 홈</a>
					  <div class="accordion" id="accordionExample">
					  <div class="accordion-item">
				    		<h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
				        극장 게시판 관리
				      </button>
				    		</h2>
				      <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div>
	 			        <a style="color: #81BEF7; background-color: #E0F2F7" href="list.jsp" class="list-group-item list-group-item-action">일반 게시판 관리</a> 
				        <a href	="reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a>
				        <a href="deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a>
				      </div>
				      </div>
					 </div> 
					 
					  <div class="accordion-item">
				    	<h2 class="accordion-header" id="headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
					        영화 게시판 관리
					      </button>
				  	   </h2>
				   	  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				       <div >

				        <a href="../movie/list.jsp" class="list-group-item list-group-item-action ">일반 게시판 관리</a>
				        <a href="../movie/reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a> 
				        <a href="../movie/deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a>

				      </div>
				     </div>
				    </div>
					 
					 <div class="accordion-item">
				    	<h2 class="accordion-header" id="headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					        스토어 게시판 관리
					      </button>
				        </h2>
				     <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				      <div >
				       	<a href="../store/list.jsp" class="list-group-item list-group-item-action">일반 게시판 관리</a>
				        <a href="../store/reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a> 
				        <a href="../store/deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a> 
				      </div>
				     </div>
				    </div>
					 
					  </div>
					</div>
				</div>
		</div>	
    	<div class="col-9">
			<h1 class="border bg-light fs-4 p-2">극장 게시판</h1>
			<div>
			<p>게시글 목록을 확인하세요.</p>
			<div>	
<%-- 게시판의 게시글 수 --%>			
				<div class="board-list-util">
					<p class="result-count"><strong>전체 <span id="total-rows" class="font-gblue"><%=totalRows %></span>건</strong></p>
				</div>
				
				
<%-- 지역/극장을 선택하는 select --%>			
				<select id="location" title="지역 선택" class="form-select selectpicker ml07 form-control mb-3" style="width: 150px; float:left; " name="locationNo" onchange="refreshTh();">
					<option value="" selected disabled>지역 선택</option>
												
<%
	for(Location location : locations){
%>
					<option value="<%=location.getNo() %>"><%=location.getName() %></option>
<%
	}
%>
						
				</select>

				<select id="theater" title="극장 선택" class="form-select selectpicker ml07 form-control mb-3" style="width: 150px; float:left; position: relative; left:5px; " name="theaterNo" onchange="refreshBo();">
					<option value="" selected disabled >극장 선택</option>
										
				</select>
	
			
			<table class="table table-sm" id="table-Tboard">
				<colgroup>
					<col width="5%">
					<col width="55%">
					<col width="15%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
<%
	for(TheaterBoard board : theaterBoards) {
%>
						
					<tr>				
						<td><%=board.getNo() %></td>
						<td><a class="text-black text-decoration-none" href="detail.jsp?no=<%=board.getNo() %>"><%=board.getName() %></a></td>
						<td><%=board.getMember().getId()%></td>
						<td><%=board.getReadCnt() %></td>
						<td><%=board.getCreateDate() %></td>
					</tr>
<%
	}
%>					
				</tbody>
			</table>
			
<%
	if(totalRows > 0){
%>
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : ""%>">
						<a href="list.jsp?page=<%=pageNo - 1 %>" class="page-link">이전</a>
					</li>
<%
	for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>				
					<li class="page-item <%=pageNo == num ? "active" : "" %>">
						<a href="list.jsp?page=<%=num %>" class="page-link"><%=num %></a>
					</li>

<%
	}
%>
					
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : ""%>">
						<a href="list.jsp?page=<%=pageNo + 1 %>" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
<%
	}
%>
			

				</div>
			</div>
		</div>
	</div>
</div>	
<script type="text/javascript">
	function refreshTh() {
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
				let htmlContent = "<option value='' selected disabled>--선택하세요--</option>";
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
		e.preventDefault();
		refreshBo(pageNo)
	}
	
	function refreshBo(pageNo) {
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
				let boards = obj.theaterBoards;  
				let pagination = obj.pagination;
				
				let htmlContents = ``;
				
				boards.forEach(function(item, index) {
					htmlContents += `
						<tr>
							<td>\${item.no}</td>
							<td><a class="text-black text-decoration-none" href="detail.jsp?no=\${item.no}">\${item.name}</a></td>
							<td>\${item.member.id}</td>
							<td>\${item.readCnt}</td>
							<td>\${item.createDate}</td>
						</tr>
					`;
				});
				
				document.querySelector("#table-Tboard tbody").innerHTML = htmlContents;
			
				
				if(pagination.totalRows > 0){
					let paginationHtmlContent = `<nav>   
						<ul class="pagination justify-content-center">
						<li class="page-item \${pagination.page <= 1 ?  'disabled' : ''}">
							<a href="list.jsp?page=\${pagination.pageNo -1}" onclick="goPage(event, \${pagination.page -1})" class="page-link">이전</a>
						</li>`;
				
					for (let num = pagination.beginPage; num <= pagination.endPage; num++) {
						
						paginationHtmlContent += `<li class="page-item \${pagination.page == num ? 'active' : ''}">
							<a href="list.jsp?page=\${num}" onclick="goPage(event, \${num})" class="page-link">\${num}</a>
							  </li>`;

					}
					
					paginationHtmlContent += `<li class="page-item \${pagination.page >= pagination.totalPages ? 'disabled' : ''}">
						<a href="list.jsp?page=\${pagination.page + 1}" onclick="goPage(event, \${pagination.page + 1})" class="page-link">다음</a>
						  </li>
						</ul>
					</nav>`
				
				
				document.querySelector(".pagination").innerHTML = paginationHtmlContent;
				} else {
				document.querySelector(".pagination").innerHTML = "";
					
				}
			}	
		};
		xhr.open("GET", "board.jsp?no=" + theaterNo + "&page=" + pageNo);
		xhr.send(null);

	}
	
</script>
</body>
</html>