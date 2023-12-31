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
	
	// 품목 셀렉트 박스 목록
	ProductCategoryDao productCategoryDao = ProductCategoryDao.getInstance();
	List<ProductCategory> categories = productCategoryDao.getCategories();
	
	// 상품이름 셀렉트 박스 목록
	StoreBoardDao storeBoardDao = StoreBoardDao.getInstance();
	List<Product> products = storeBoardDao.getProducts();	

	// totalrows (de, re ='N')
	int totalRows = storeBoardDao.getTotalRows();
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	
	// 모든 스토어 게시물 목록 가져오기
	List<StoreBoard> storeBoards = storeBoardDao.getAllStoreBoards(pagination.getBegin(), pagination.getEnd());
	

%>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>게시판 목록 | 스토어 &#60; 영화 그 이상의 감동. MGV</title>
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


<%-- 스토어 게시판 시작 --%>
 
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">스토어 게시판</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>게시글 목록을 확인하세요.</p>

<%-- 게시판의 게시글 수 --%>			
				<div class="board-list-util">
					<p class="result-count"><strong>전체 <span id="total-rows" class="font-gblue"><%=totalRows %></span>건</strong></p>
				</div>

				
<%-- 지역/극장을 선택하는 select --%>			
				<select id="cat" title="품목 선택" class="form-select selectpicker ml07 form-control mb-3" style="width: 150px; float:left; " name="catNo" onchange="refreshProduct();">
					<option value= 0 selected disabled>품목 선택</option>
												
<%
	for(ProductCategory category : categories){
%>
					<option value="<%=category.getNo() %>"><%=category.getName() %></option>
<%
	}
%>
						
					</select>
					
					<select id="product" title="상품 선택" class="form-select selectpicker ml07 form-control mb-3" style="width: 150px; float:left; position: relative; left:5px; " name="productNo"  onchange="refreshBo();">
						<option value= 0 selected disabled>상품 선택</option>
						
					</select>


				
	
			
			<table class="table table-sm" id="table-SBoard">
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
	for(StoreBoard board : storeBoards) {
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
			<div class="text-end">
				<a href="form.jsp" class="btn btn-primary btn-sm">새 게시글 등록</a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function refreshProduct() {
			// select 박스에서 선택된 값 조회하기
			let catNo = document.getElementById("cat").value;
			
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
						let productNo = item.no;
						let productName = item.name;
						
						htmlContent += `<option value="\${productNo}"> \${productName}</option>`;
					});
					// 4. 화면에 html 컨텐츠 반영시키기
					document.getElementById("product").innerHTML = htmlContent;
				}
			}
			// 2. XMLHttpRequest 객체 초기화하기(요청방식, 요청URL 지정)
			xhr.open("GET", "cat.jsp?no=" + catNo);
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
				let paginationHtmlContent = ``;
				
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
		xhr.open("GET", "board.jsp?no=" + productNo + "&page=" + pageNo);
		xhr.send(null);

	}

</script>
</body>
</html>