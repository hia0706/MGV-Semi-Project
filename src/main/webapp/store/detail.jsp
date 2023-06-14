<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청파라미터 상품번호
	int productNo = Integer.parseInt(request.getParameter("no"));

	// 상품번호로 상품정보 가져오기
	ProductDao productDao = ProductDao.getInstance();
	Product product = productDao.getProductByNo(productNo);
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
</head>
<style>
	p {
		margin: 10px;
	}
</style>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="스토어"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2"><%=product.getName() %></h1>
			<p ><%=product.getDescription() %></p>
		</div>
	</div>
	<div>
<%
	if (product.getNo() == productNo) {
%>
		<img alt="상품별 사진" src="../images/products/<%=product.getNo() %>.png" width="30%">
<%
	}
%>
	</div>
	<div>
	<table class="table table-bordered ">
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="10%">
			<col width="40%">
		</colgroup>
		<tbody>
			<tr>
				<th>상품이름</th>
				<td><%=product.getName() %></td>
				<th>상품가격</th>
				<td><Strong><%=product.getPrice() %>원</Strong></td>
			</tr>
			<tr>
				<th>상품구성</th>
				<td><%=product.getComposition() %></td>
			</tr>
		</tbody>
	</table>
	<div class="text-end">
		<a href="purchase.jsp" class="btn btn-primary btn-sm">구매하기</a>
	</div>
	</div>
</div>
</body>
</html>