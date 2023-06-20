<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="vo.ProductCategory"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductCategoryDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String)session.getAttribute("loginId");

	// 상품 카테고리 불러오기
	ProductCategoryDao productCategoryDao = ProductCategoryDao.getInstance();
	List<ProductCategory> categories = productCategoryDao.getCategories();
	
	// 모든 상품정보 가져오기
	ProductDao productDao = ProductDao.getInstance();
	List<Product> productList = productDao.getAllProducts();

%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>먹거리 &#60; 스토어 서비스 | 영화 그 이상의 감동. MGV</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style>
	a {
		text-align: center;
	}
</style>


</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="스토어"/>
</jsp:include>

<div class="container ">
	<div class="store_wrap">
		<h2>스토어</h2>
	</div>
	<div class="border">
		<ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
<%
	for (ProductCategory productCategory : categories) {
%>
			<li class="nav-item col-md-auto" role="presentation">
				<button class="nav-link link-dark col-md-auto <%=productCategory.getNo() == 1 ? "active":"" %>" id="category-tab" data-bs-toggle="tab" data-bs-target="#category-tab-pane-<%=productCategory.getNo() %>" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">
				<%=productCategory.getName() %>
				</button>
			</li>
<%
	}
%>
		</ul>
		<div class="tab-content store-list" id="myTabContent">
			<div class="tab-pane fade show active" id="category-tab-pane-1" role="tabpanel" aria-labelledby="category-1-tab" tabindex="0" >
				<ul class="list-group list-group-horizontal row row-cols-4" style="margin-left: 0;">
<%
	for (Product product : productList) {
		if (product.getProductCategory().getNo() == 1) {
%>
					<li class="list-group-item col-3 border-0" style="text-align: center">
						<a href="detail.jsp?no=<%=product.getNo() %>"><img alt="상품별 사진" src="../images/products/<%=product.getNo() %>.png" class="img-thumnail" width="50%" style="padding: 0.5em 0;"></a><br />
						<a href="detail.jsp?no=<%=product.getNo() %>" style="text-decoration: none;" class="link-dark"><%=product.getName() %></a>
					</li>
<%
		}
	}
%>
				</ul>
			</div>
			<div class="tab-pane fade" id="category-tab-pane-2" role="tabpanel" aria-labelledby="category-2-tab" tabindex="0">
				<ul class="list-group list-group-horizontal row row-cols-4" style="margin-left: 0;">
<%
	for (Product product : productList) {
		if (product.getProductCategory().getNo() == 2) {
%>
					<li class="list-group-item col-3 border-0" style="text-align: center">
						<a href="detail.jsp?no=<%=product.getNo() %>"><img alt="상품별 사진" src="../images/products/<%=product.getNo() %>.png" class="img-thumnail" width="50%" style="padding: 0.5em 0;"></a><br />
						<a href="detail.jsp?no=<%=product.getNo() %>" style="text-decoration: none;" class="link-dark"><%=product.getName() %></a>
					</li>	
<%
		}
	}
%>
				</ul>
			</div>
			<div class="tab-pane fade" id="category-tab-pane-3" role="tabpanel" aria-labelledby="category-3-tab" tabindex="0">
				<ul class="list-group list-group-horizontal row row-cols-4" style="margin-left: 0;">
<%
	for (Product product : productList) {
		if (product.getProductCategory().getNo() == 3) {
%>
					<li class="list-group-item col-3 border-0" style="text-align: center">
						<a href="detail.jsp?no=<%=product.getNo() %>"><img alt="상품별 사진" src="../images/products/<%=product.getNo() %>.png" class="img-thumnail" width="50%" style="padding: 0.5em 0;"></a><br />
						<a href="detail.jsp?no=<%=product.getNo() %>" style="text-decoration: none;" class="link-dark"><%=product.getName() %></a>
					</li>	
<%
		}
	}
%>
				</ul>
			</div>
			<div class="tab-pane fade" id="category-tab-pane-4" role="tabpanel" aria-labelledby="category-4-tab" tabindex="0">
				<ul class="list-group list-group-horizontal row row-cols-4" style="margin-left: 0;">
<%
	for (Product product : productList) {
		if (product.getProductCategory().getNo() == 4) {
%>
					<li class="list-group-item col-3 border-0" style="text-align: center">
						<a href="detail.jsp?no=<%=product.getNo() %>"><img alt="상품별 사진" src="../images/products/<%=product.getNo() %>.png" class="img-thumnail" width="50%" style="padding: 0.5em 0;"></a><br />
						<a href="detail.jsp?no=<%=product.getNo() %>" style="text-decoration: none;" class="link-dark"><%=product.getName() %></a>
					</li>	
<%
		}
	}
%>
				</ul>
			</div>
			<div class="tab-pane fade" id="category-tab-pane-5" role="tabpanel" aria-labelledby="category-5-tab" tabindex="0">
				<ul class="list-group list-group-horizontal row row-cols-4" style="margin-left: 0;">
<%
	for (Product product : productList) {
		if (product.getProductCategory().getNo() == 5) {
%>
					<li class="list-group-item col-3 border-0" style="text-align: center">
						<a href="detail.jsp?no=<%=product.getNo() %>"><img alt="상품별 사진" src="../images/products/<%=product.getNo() %>.png" class="img-thumnail" width="50%" style="padding: 0.5em 0;"></a><br />
						<a href="detail.jsp?no=<%=product.getNo() %>" style="text-decoration: none;" class="link-dark"><%=product.getName() %></a>
					</li>	
<%
		}
	}
%>
				</ul>
			</div>
			<div class="tab-pane fade" id="category-tab-pane-6" role="tabpanel" aria-labelledby="category-6-tab" tabindex="0">
				<ul class="list-group list-group-horizontal row row-cols-4" style="margin-left: 0;">
<%
	for (Product product : productList) {
		if (product.getProductCategory().getNo() == 6) {
%>
					<li class="list-group-item col-3 border-0" style="text-align: center">
						<a href="detail.jsp?no=<%=product.getNo() %>"><img alt="상품별 사진" src="../images/products/<%=product.getNo() %>.png" class="img-thumnail" width="50%" style="padding: 0.5em 0;"></a><br />
						<a href="detail.jsp?no=<%=product.getNo() %>" style="text-decoration: none;" class="link-dark"><%=product.getName() %></a>
					</li>	
<%
		}
	}
%>
				</ul>
			</div>
			<div class="tab-pane fade" id="category-tab-pane-7" role="tabpanel" aria-labelledby="category-7-tab" tabindex="0">
				<ul class="list-group list-group-horizontal row row-cols-4" style="margin-left: 0;">
<%
	for (Product product : productList) {
		if (product.getProductCategory().getNo() == 7) {
%>
					<li class="list-group-item col-3 border-0" style="text-align: center">
						<a href="detail.jsp?no=<%=product.getNo() %>"><img alt="상품별 사진" src="../images/products/<%=product.getNo() %>.png" class="img-thumnail" width="50%" style="padding: 0.5em 0;"></a><br />
						<a href="detail.jsp?no=<%=product.getNo() %>" style="text-decoration: none;" class="link-dark"><%=product.getName() %></a>
					</li>	
<%
		}
	}
%>
				</ul>
			</div>
			<div class="tab-pane fade" id="category-tab-pane-8" role="tabpanel" aria-labelledby="category-8-tab" tabindex="0">
				<ul class="list-group list-group-horizontal row row-cols-4" style="margin-left: 0;">
<%
	for (Product product : productList) {
		if (product.getProductCategory().getNo() == 8) {
%>
					<li class="list-group-item col-3 border-0" style="text-align: center">
						<a href="detail.jsp?no=<%=product.getNo() %>"><img alt="상품별 사진" src="../images/products/<%=product.getNo() %>.png" class="img-thumnail" width="50%" style="padding: 0.5em 0;"></a><br />
						<a href="detail.jsp?no=<%=product.getNo() %>" style="text-decoration: none;" class="link-dark"><%=product.getName() %></a>
					</li>	
<%
		}
	}
%>
				</ul>
			</div>
		</div>
	</div>
</div>

</body>
</html>



















