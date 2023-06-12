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
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="스토어"/>
</jsp:include>
<div class="container">
	<div class="select-productCategory border" >
		<ul class="nav nav-tabs nav-fill" id="myTab" role="tablist" >
<%
	for (ProductCategory productCategory : categories) {
%>
			<li class="nav-item col-md-auto" role="presentation">
				<a class="nav-link link-dark col-md-auto <%=productCategory.getNo() == 1? "active":""%>" id="productCategory-tab" data-bs-toggle="tab" data-bs-target="#productCategory-tab-pane-<%=productCategory.getNo() %>" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true"><%=productCategory.getName() %></a>
			</li>
<%
	}
%>
		</ul>
	</div>
</div>
</body>
</html>



















