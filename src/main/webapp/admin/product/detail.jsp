<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 URL : http://localhost/mgv/admin/product/detail.jsp
	// 요청파라미터 조회
	int no = Integer.parseInt(request.getParameter("no"));
	
	// 업무로직 수행
	ProductDao productDao = ProductDao.getInstance();
	
	// 상품 상세정보 조회하기
	Product product = productDao.getProductByNo(no);
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
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="상품"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">상품 상세 정보</h1>
		</div>
	</div>
		<div class="row mb-3">
		<div class="col-12">
			<p>상품 상세정보를 확인하세요.</p>
			
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
						<th>카테고리</th>
						<td><%=product.getProductCategory().getName() %></td>
					</tr>
					<tr>
						<th>상품번호</th>
						<td><Strong><%=product.getNo() %></Strong></td>
						<th>가격</th>
						<td><%=product.getPrice() %>원</td>
					</tr>
					<tr>
						<th>판매여부</th>
						<td><%="N".equals(product.getSoldOut()) ? "판매중" : "판매종료" %></td>
						<th>재고 수량</th>
						<td><%=product.getStock() %></td>
					</tr>
					<tr>
						<th>수정일자</th>
						<td><%=product.getUpdateDate() %></td>
						<th>등록일자</th>
						<td><%=product.getCreateDate() %></td>
					</tr>
					<tr>
						<th>상품설명</th>
						<td colspan="4"><%=product.getDescription() %></td>
					</tr>
				</tbody>
			</table>
			<div>
				<!-- 
					현재 URL = http://localhost/mgv/admin/product/detail.jsp?no=XXX'
					
					목록 ->    http://localhost/mgv/admin/product/list.jsp
					삭제 ->    http://localhost/mgv/admin/product/delete.jsp
				 -->
			</div>
			<div class="text-end">
				<a href="delete.jsp?no=<%=product.getNo() %>" class="btn btn-danger btn-sm">삭제</a>
				<a href="modifyForm.jsp?no=<%=product.getNo() %>" class="btn btn-warning btn-sm">수정</a>
				<a href="list.jsp" class="btn btn-primary btn-sm">목록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>