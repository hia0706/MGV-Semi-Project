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
	<jsp:param name="menu" value="극장"/>
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
					<p class="result-count"><strong>전체 <span id="totalCnt" class="font-gblue"><%=totalRows %></span>건</strong></p>
				</div>
				
<%--검색 : 각 select에 name을 설정하고, method를 get으로 설정하면 된다  --%>				
				<form method="get" action="selectlist.jsp" >
				
<%-- 지역/극장을 선택하는 select --%>			
				<select id="theater" title="품목 선택" class="selectpicker" name="catNo" >
					<option value= 0 >품목 선택</option>
												
<%
	for(ProductCategory category : categories){
%>
					<option value="<%=category.getNo() %>"><%=category.getName() %></option>
<%
	}
%>
						
					</select>

					<select id="theater02" title="상품 선택" class="selectpicker ml07" name="productNo" >
						<option value= 0 >상품 선택</option>
						
<%
	for(Product product : products){
%>
					<option value="<%=product.getNo() %>"><%=product.getName() %></option>
<%
	}
%>						
					</select>
					<button type="submit" id="searchBtn" class="btn-search-input" >검색</button>
				</form>
				
	
			
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


<%
	for(StoreBoard board : storeBoards) {
%>
					<tr>
						<td><%=board.getNo() %></td>
						<td><a href="read.jsp?no=<%=board.getNo() %>"><%=board.getName() %></a></td>
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
</body>
</html>