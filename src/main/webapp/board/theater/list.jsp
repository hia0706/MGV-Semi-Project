<%@page import="vo.Theater"%>
<%@page import="dao.TheaterDao"%>
<%@page import="vo.Location"%>
<%@page import="java.util.List"%>
<%@page import="dao.LocationDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<%
	LocationDao locationDao = LocationDao.getInstance();
	List<Location> locations = locationDao.getLocations();

	TheaterDao theaterDao = TheaterDao.getInstance();
	List<Theater> theaters = theaterDao.getAllTheaters();

%>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

<%--

<jsp:include page="../../../admin/nav.jsp">
	<jsp:param name="menu" value="극장"/>
</jsp:include>

--%>

<%--nav파일 수정 전 확인 코드--%> 
<%@page import="vo.Member"%>
<%
	String loginType = (String) session.getAttribute("loginType");
	String loginId = (String) session.getAttribute("loginId");

	String menu = request.getParameter("menu");

%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3 ">
		<a href="/mgv/home.jsp">
           <img src="/mgv/images/mgv.png" alt="mgv" width="80" height="50" class="">
        </a>
	<div class="container">
    	
    	<ul class="navbar-nav me-auto">
        	<li class="nav-item"><a class="nav-link <%="홈".equals(menu) ? "active" : "" %>" href="/mgv/home.jsp">홈</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="무비".equals(menu) ? "active" : "" %>" href="/mgv/movie/list.jsp">무비</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="극장".equals(menu) ? "active" : "" %>" href="/mgv/theater/theaters.jsp">극장</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="스토어".equals(menu) ? "active" : "" %>" href="/mgv/product.jsp">스토어</a></li>    	
        	<li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	              게시판
	            </a>
	            <ul class="dropdown-menu">
	              <li><a class="dropdown-item" href="#">극장</a></li>
	              <li><a class="dropdown-item" href="#">영화</a></li>
	              <li><a class="dropdown-item" href="#">스토어</a></li>
<%--
	              <li><hr class="dropdown-divider"></li>
	              <li><a class="dropdown-item" href="#">공지사항</a></li>

 --%>            
            	</ul>
            </li>
      	</ul>
<%
	if (loginType != null) {
%>
		<div class="dropdown navbar-text me-5">
			<a href="/mgv/member/detail.jsp">
				<img src="/mgv/images/myprofile.png" alt="<%=loginId %>" width="30" height="30">
			</a> 
		  <button class="btn btn-secondary btn-sm dropdown-toggle " type="button" data-bs-toggle="dropdown" aria-expanded="false">
				<strong class="text-white bolder"><%=loginId %>님</strong>
		  </button>
		  <ul class="dropdown-menu dropdown-menu-dark">
			    <li><a class="dropdown-item" href="/mgv/member/detail.jsp">내 정보</a></li>
			    <li><a class="dropdown-item" href="/mgv/member/orderlist.jsp">구매내역</a></li>
		  </ul>
		</div>
		
<%		
	}
%>      	
      	<ul class="navbar-nav">
      	<!-- 장바구니 보류 -->
        	<%-- <li class="nav-item"><a class="nav-link <%="장바구니".equals(menu) ? "active" : "" %>" href="/movie/cart.jsp">장바구니</a></li>   --%>  	
<%
	if (loginId != null) {
%>
         	<li class="nav-item"><a class="nav-link " href="/mgv/member/logout.jsp">로그아웃</a></li>
<%
	} else {
%>
         	<li class="nav-item"><a class="nav-link <%="로그인".equals(menu) ? "active" : "" %>" href="/mgv/member/loginform.jsp">로그인</a></li>
        	<li class="nav-item"><a class="nav-link <%="회원가입".equals(menu) ? "active" : "" %>" href="/mgv/member/joinform.jsp">회원가입</a></li>   
<%
	}
%>
      	</ul>
   	</div>

</nav> 

<%-- 극장 게시판 시작 --%>
 
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">게시글 목록</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>게시글 목록을 확인하세요.</p>

<%-- 게시판의 게시글 수 --%>			
				<div class="board-list-util">
					<p class="result-count"><strong>전체 <span id="totalCnt" class="font-gblue">0</span>건</strong></p>

<%-- 지역/극장을 선택하는 select --%>			
					<select id="theater" title="지역 선택" class="selectpicker" onchange="locationChoice">
						<option value="">지역 선택</option>
												
<%
	for(Location location : locations){
%>
					<option value="<%=location.getNo() %>"><%=location.getName() %></option>
<%
	}
%>
						
					</select>

					<select id="theater02" title="극장 선택" class="selectpicker ml07" >
						<option value="">극장 선택</option>
						
<%
	for(Theater theater : theaters){
%>
					<option value="<%=theater.getNo() %>"><%=theater.getName() %></option>
<%
	}
%>						
					</select>
					<button type="button" id="searchBtn" class="btn-search-input">검색</button>
				</div>
				
<script type="text/javascript">

		let location = document.getElementById("theater").value;
		let theater = document.getElementById("theater02").value;
	locationChoice(){
			
		let opt = [];
		location.forEach( data => {
			
				opt.push(
					`<option value= >`		
				);
			});
		

		}
		

</script>			
			
			<table class="table table-sm">
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

<%--

					<tr>
						<td><%=board.getNo() %></td>
						<td><a href="detail.jsp?no=<%=board.getNo() %>"><%=board.getTitle() %></a></td>
						<td><%=board.getCustomer().getName() %></td>
						<td><%=board.getCommentCnt() %></td>
						<td><%=board.getCreateDate() %></td>
					</tr>
 --%>
 
 					<tr>
						<td>100</td>
						<td><a href="detail.jsp?no=100">MGV 익선점 좋네요</a></td>
						<td>작성자</td>
						<td>100</td>
						<td>2023-06-10</td>
					</tr>
 					<tr>
						<td>100</td>
						<td><a href="detail.jsp?no=100">MGV 익선점 좋네요</a></td>
						<td>작성자</td>
						<td>100</td>
						<td>2023-06-10</td>
					</tr>
 					<tr>
						<td>100</td>
						<td><a href="detail.jsp?no=100">MGV 익선점 좋네요</a></td>
						<td>작성자</td>
						<td>100</td>
						<td>2023-06-10</td>
					</tr>
 					<tr>
						<td>100</td>
						<td><a href="detail.jsp?no=100">MGV 익선점 좋네요</a></td>
						<td>작성자</td>
						<td>100</td>
						<td>2023-06-10</td>
					</tr>
 					<tr>
						<td>100</td>
						<td><a href="detail.jsp?no=100">MGV 익선점 좋네요</a></td>
						<td>작성자</td>
						<td>100</td>
						<td>2023-06-10</td>
					</tr>
			
				</tbody>
			</table>
<%--
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : ""%>">
						<a href="list.jsp?page=1" class="page-link">이전</a>
					</li>
					
					<li class="page-item active">
						<a href="list.jsp?page=1" class="page-link"><%=pageNo%></a>
					</li>

					
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : ""%>">
						<a href="list.jsp?page=2" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
 --%>
			
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item ">
						<a href="list.jsp?page=1" class="page-link">이전</a>
					</li>
					
					<li class="page-item active">
						<a href="list.jsp?page=1" class="page-link">1</a>
					</li>
					<li class="page-item">
						<a href="list.jsp?page=2" class="page-link">2</a>
					</li>
					<li class="page-item">
						<a href="list.jsp?page=3" class="page-link">3</a>
					</li>
					
					<li class="page-item ">
						<a href="list.jsp?page=2" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
			
			<div class="text-end">
				<a href="form.jsp" class="btn btn-primary btn-sm">새 게시글 등록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>