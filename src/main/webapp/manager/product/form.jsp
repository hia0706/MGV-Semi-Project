<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
<jsp:include page="../../manager-nav.jsp">
	<jsp:param value="menu" name="스토어"/>
</jsp:include>
<div class="container">
<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">물품 등록하기</h1>
      	</div>
      	   	<div class="row mb-3">
   		<div class="col-12">
   			<p>물품 정보를 입력하고 등록하세요.</p>

   			<form class="border bg-light p-2" name="form" method="post" action="insert.jsp">
   				
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">물품명</label>
   					<input type="text" class="form-control" id="product-name" name="name" style="width:300px" placeholder="물품명을 입력해주세요."/>
   				</div>
   				
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">물품가격</label>
   					<input type="text" class="form-control" id="product-price" name="price" style="width:300px" placeholder="물품 가격을 입력해주세요."/>
   				</div>
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">물품 수량</label>
   					<input type="text" class="form-control" id="product-stock" name="stock" style="width:300px" placeholder="물품 수량을 입력해주세요."/>
   				</div>
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">물품 설명</label>
   					<input type="text" class="form-control" id="product-description" name="description" style="width:500px" placeholder="상세 설명을 입력해주세요."/>
   				</div>
   				

   				<div class="text-center mb-3">
   					<button type="submit" class="btn btn-primary">물품등록</button>
   					<button type="reset" class="btn btn-danger">취소</button>
   				</div>
   			</form>
   		</div>
   	</div>
</div>

</div>
</body>
</html>