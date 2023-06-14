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
<style type="text/css">

</style>
<script type="text/javascript">
	
</script>
</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="장바구니"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">장바구니</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>장바구니를 확인하세요.</p>
			<table class="table table-striped table-hover">
				<tbody>
					<tr class="table-dark">
						<th id="name" style="width: 15%;">상품명</th>
						<th id="price" style="width: 15%;">판매금액</th>
						<th id="amount" style="width: 15%;">수량</th>
						<th id="totalPrice" style="width: 15%;">총 구매금액</th>
						<th id="delete" style="width: 15%;">삭제</th>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>