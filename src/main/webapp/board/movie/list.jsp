<%@page import="vo.MovieBoard"%>
<%@page import="dao.MovieBoardDao"%>
<%@page import="vo.StoreBoard"%>
<%@page import="dao.StoreBoardDao"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="dao.ProductCategoryDao"%>
<%@page import="vo.ProductCategory"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<%
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);

	// totalrows (de, re ='N')
	MovieBoardDao movieBoardDao = MovieBoardDao.getInstance();
	int totalRows = movieBoardDao.getTotalRows();
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	
	// 모든 스토어 게시물 목록 가져오기
	List<MovieBoard> movieBoards = movieBoardDao.getAllMovieBoards(pagination.getBegin(), pagination.getEnd());

%>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/mgv.ico" type="images/x-icon">
<title>

</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="게시판"/>
</jsp:include>


<%-- 영화 게시판 시작 --%>
 
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">영화 게시판</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>게시글 목록을 확인하세요.</p>

<%-- 게시판의 게시글 수 --%>			
				<div class="board-list-util">
					<p class="result-count"><strong>전체 <span id="total-rows" class="font-gblue"><%=totalRows %></span>건</strong></p>
				</div>


			<table class="table table-sm" id="table-SBoard"">
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
	for(MovieBoard board : movieBoards) {
%>
					<tr>
						<td><%=board.getNo() %></td>
						<td><a class="text-black text-decoration-none" href="read.jsp?no=<%=board.getNo() %>"><%=board.getName() %></a></td>
						<td><%=board.getMember().getId()%></td>
						<td><%=board.getReadCnt() %></td>
						<td><%=board.getCreateDate() %></td>
					</tr>

<%
	}
%>
 					
			
				</tbody>
			</table>
			
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

			
			
			<div class="text-end">
				<a href="form.jsp" class="btn btn-primary btn-sm">새 게시글 등록</a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	
	function goPage(e, pageNo) {
		e.preventDefault();
		refreshBo(pageNo)
	}
	
	function refreshBo(pageNo) {
		pageNo = pageNo || 1;
		// select 박스에서 선택된 값 조회하기
		let productNo = document.getElementById("product").value;
		
		// ajax 요청
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4) {      
				let text = xhr.responseText;
				let obj = JSON.parse(text);
				
				document.getElementById("total-rows").textContent = obj.totalRows;
				let boards = obj.storeBoards;  
				let pagination = obj.pagination;
				
				let htmlContents = ``;
				
				boards.forEach(function(item, index) {
					htmlContents += `
						<tr>
							<td>\${item.no}</td>
							<td><a class="text-black text-decoration-none" href="read.jsp?no=\${item.no}">\${item.name}</a></td>
							<td>\${item.member.id}</td>
							<td>\${item.readCnt}</td>
							<td>\${item.createDate}</td>
						</tr>
					`;
				});
				
				document.querySelector("#table-SBoard tbody").innerHTML = htmlContents;
			
				let paginationHtmlContent = `<nav>   
					<ul class="pagination justify-content-center">
					<li class="page-item \${pagination.pageNo <= 1 ?  'disabled' : ''}">
						<a href="list.jsp?page=\${pagination.pageNo -1}" class="page-link">이전</a>
					</li>`;
			
				for (let num = pagination.beginPage; num <= pagination.endPage; num++) {
					
					paginationHtmlContent += `<li class="page-item \${pagination.pageNo == num ? 'active' : ''}">
												<a href="list.jsp?page=\${num}" onclick="goPage(event, \${num})" class="page-link">\${num}</a>
											  </li>`;

				}
				
				paginationHtmlContent += `<li class="page-item \${pagination.pageNo >= pagination.totalRows ? 'disabled' : ''}">
					<a href="list.jsp?page=\${pagination.pageNo + 1}" class="page-link">다음</a>
					  </li>
					</ul>
				</nav>`
				
				document.querySelector(".pagination").innerHTML = paginationHtmlContent;

			}	
		};
		xhr.open("GET", "board.jsp?no=" + productNo + "&page=" + pageNo);
		xhr.send(null);

	}

</script>
</body>
</html>