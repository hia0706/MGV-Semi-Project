<%@page import="dao.StoreBoardDao"%>
<%@page import="dao.ProductDao"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductCategoryDao"%>
<%@page import="vo.ProductCategory"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//품목 셀렉트 박스 목록
	ProductCategoryDao productCategoryDao = ProductCategoryDao.getInstance();
	List<ProductCategory> categories = productCategoryDao.getCategories();
	
	// 상품이름 셀렉트 박스 목록
	StoreBoardDao storeBoardDao = StoreBoardDao.getInstance();
	List<Product> products = storeBoardDao.getProducts();

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

<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="게시판"/>
</jsp:include>

<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
         	<h1 class="border bg-light fs-4 p-2">게시글 등록폼</h1>
      	</div>
	</div>  
	<div class="row mb-3">
		<div class="col-12">
			<p>제목과 내용을 입력하세요</p>		
			<form class="border bg-light p-3" method="post" action="insert.jsp" >
				<div class="form-group mb-2">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="name"/>
				</div>

								
				<div class="form-group mb-2" style="float: left; width: 33%; padding:10px;">
					<label class="form-label">별점</label>
							<div class="form-check form-check-inline ">
								<input class="form-check-input" type="radio" id="Agrade" name="grade" value="A" checked="checked"> 
									<label class="form-check-label" for="Agrade">A</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" id="Bgrade" name="grade" value="B"> 
								<label class="form-check-label mb-2" for="female">B</label>
							</div>
							<div class="form-check form-check-inline ">
								<input class="form-check-input" type="radio" id="Cgrade" name="grade" value="C" > 
									<label class="form-check-label" for="Cgrade">C</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" id="Dgrade" name="grade" value="D"> 
								<label class="form-check-label mb-2" for="Dgrade">D</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" id="Egrade" name="grade" value="E"> 
								<label class="form-check-label mb-2" for="Egrade">E</label>
							</div>
				</div>				
								
				<div class="form-group mb-2" style="float: left; width: 33%; padding:10px;">
					<label class="form-label">품목</label>
					<select class="form-select" name="catNo">
					<option value="" selected="selected" disabled="disabled">품목</option>
<%
	for (ProductCategory category : categories){
%>
					<option value="<%=category.getNo()%>"><%=category.getName() %></option>
<%
	}
%>
					</select>
				</div>
				
				<div class="form-group mb-2" style="float: left; width: 33%; padding:10px;">
					<label class="form-label">상품</label>
					<select class="form-select" name="productNo">
					<option value="" selected="selected" disabled="disabled">상품</option>
<%
	for (Product product : products){
%>
					<option value="<%=product.getNo()%>"><%=product.getName() %></option>
<%
	}
%>

					</select>
				</div>
				
				
				<div class="form-group mb-2">
					<label class="form-label">내용</label>
					<textarea rows="10" class="form-control" name="content"></textarea>
				</div>


		
				<div class="text-end">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>