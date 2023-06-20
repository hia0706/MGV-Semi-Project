<%@page import="vo.ProductCategory"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductCategoryDao"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 URL : http://localhost/mgv/admin/product/modifyForm.jsp?no=xxx
	
	// 요청파라미터 정보를 조회 : 상품번호 획득
	int no = Integer.parseInt(request.getParameter("no"));

	// 요청파라미터로 전달받은 상품번호에 해당하는 상품정보 조회
	ProductDao productDao = ProductDao.getInstance();
	Product product = productDao.getProductByNo(no);
	int categoryNo = product.getProductCategory().getNo();
	
	// 모든 카테고리 목록정보를 조회하기
	ProductCategoryDao productCategoryDao = ProductCategoryDao.getInstance();
	List<ProductCategory> categories = productCategoryDao.getCategories();
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>상품 수정페이지 &#60; 스토어 관리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="checkProduct.js"></script>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param value="menu" name="스토어"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">상품정보 수정</h1>
		</div>
	</div>
		<div class="row mb-3">
		<div class="col-12">
			<p>상품정보를 확인하고, 수정하세요.</p>
			
			<form class="border bg-light p-3" method="post" action="modify.jsp">
				<input type="hidden" name="no" value="<%=no %>">
				<div class="form-group mb-2">
					<label class="form-label">카테고리</label>
					<select class="form-select" name="catNo">
<%
	for (ProductCategory cat : categories) {
%>	
						<option value="<%=cat.getNo() %>" <%=cat.getNo() == categoryNo ? "selected" : "" %>> <%=cat.getName() %></option>
<%		
	}
%>
					</select>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">상품이름</label>
					<input id="product-name" type="text" class="form-control" name="name" value="<%=product.getName() %>"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">상품가격</label>
					<input id="product-price" type="text" class="form-control" name="price" value="<%=product.getPrice() %>"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">재고수량</label>
					<input id="product-stock" type="text" class="form-control" name="stock" value="<%=product.getStock()%>"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">판매여부</label>
					<input id="product-soldout" type="text" class="form-control" name="soldOut" value="<%=product.getSoldOut() %>"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">상품 구성</label>
					<input id="product-composition" type="text" class="form-control" name="composition" value="<%=product.getComposition() %>"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">상품 설명</label>
					<textarea id="product-description" class="form-control" rows="5" name="description"><%=product.getDescription() == null ? "내용없음" : product.getDescription() %></textarea>
				</div>
				<div class="text-end">
					<a href="detail.jsp?no=<%=product.getNo() %>" type="reset" class="btn btn-secondary btn-sm">취소</a>
					<button type="submit" class="btn btn-primary btn-sm" onclick="return check()">수정</button>
				</div>
			</form>
		</div>
	</div>

</div>
</body>
</html>