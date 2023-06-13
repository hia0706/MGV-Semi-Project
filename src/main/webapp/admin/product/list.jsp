<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="dto.Pagination"%>
<%@page import="dao.ProductDao"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 URL : http://localhost/mgv/admin/product/list.jsp
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);

	ProductDao productDao = ProductDao.getInstance();
	
	int totalRows = productDao.getTotalRows();
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	
	// 데이터 조회하기
	List<Product> productList = productDao.getProducts(pagination.getBegin(), pagination.getEnd());
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
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="상품"/>
</jsp:include>
<div class="container">
<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">전체 상품 리스트</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>전체 상품 목록을 확인하세요.</p>
			<table class="table">
				<thead>
					<tr class="table-dark">
						<th>상품 번호</th>
						<th>상품 카테고리</th>
						<th>상품명</th>
						<th>상품가격</th>
						<th>상품 재고</th>
						<th>상품 입고날짜</th>
						<th>상품 수정날짜</th>
						<th>상품 내용</th>
					</tr>
				</thead>
				<tbody>
<%
for (Product product : productList) {
%>
					<tr>						
						<td><%=product.getNo()%></td>
						<td><%=product.getProductCategory().getName()%></td>
						<td><a href="detail.jsp?no=<%=product.getNo()%>" class="text-black text-decoration-none"><%=product.getName()%></a></td>
						<td><%=product.getPrice()%></td>
						<td><%=product.getStock()%>개</td>
						<td><%=product.getCreateDate()%></td>
						<td><%=product.getUpdateDate()%></td>
						<td><%=product.getDescription()%></td>
					</tr>
<%
}
%>
				</tbody>
			</table>
			
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : ""%>">
						<a href="list.jsp?page=<%=pageNo-1%>" class="page-link">이전</a>
					</li>
<%
for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>
					<li class="page-item <%=pageNo == num ? "active" : ""%>" >
						<a href="list.jsp?page=<%=num%>" class="page-link"><%=num%></a>
					</li>
<%
}
%>
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : ""%>">
						<a href="list.jsp?page=<%=pageNo+1 %>" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
			
			<div class="text-end">
				<a href="form.jsp" class="btn btn-primary btn-sm">새 상품 등록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>