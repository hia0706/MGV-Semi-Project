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
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="MEMBER"/>
</jsp:include>

<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">구매 내역</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>구매내역을 확인하세요</p>
			<table class="table table-striped table-hover">
				<tbody>
					<tr class="table-dark">
						<th style="width: 15%;">상품명</th>
						<th style="width: 15%;">판매금액</th>
						<th style="width: 15%;">수량</th>
						<th style="width: 15%;">구매금액</th>
					</tr>
					<tr>
						<td style="width: 25%;">팝콘</td>
						<td style="width: 25%;">
							<strong>20000</strong>원</td>
						<td style="width: 25%;">1</td>
						<td style="width: 25%;">
							<strong>18000</strong>원</td>
					</tr>
					<tr>
						<td style="width: 25%;">콜라</td>
						<td style="width: 25%;">
							<strong>2000</strong>원</td>
						<td style="width: 25%;">2</td>
						<td style="width: 25%;">
							<strong>4000</strong>원</td>
					</tr>
					<tr>
						<td style="width: 25%;">후라이드</td>
						<td style="width: 25%;">
							<strong>24000</strong>원</td>
						<td style="width: 25%;">1</td>
						<td style="width: 25%;">
							<strong>24000</strong>원</td>
					</tr>
					<tr>
						<td style="width: 25%;">맛밤</td>
						<td style="width: 25%;">
							<strong>3500</strong>원</td>
						<td style="width: 25%;">3</td>
						<td style="width: 25%;">
							<strong>10500</strong>원</td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>
</div>
	
<div class="container ">
	<div class="row mb-3">
    	<div class="col-12">
    		<table class="table">
				<tbody>
					<tr class="table bg-light">
						<th style="width: 20%;" colspan="2">총 상품금액</th>
						<th style="width: 20%;" colspan="2">할인금액</th>
						<th style="width: 20%;">총 결제금액</th>
					</tr>
					<tr>
						<td class="table-bg" style="width: 20%;">
						<td class="table-bg" style="width: 20%;">
							<img src="/mgv/images/member/minus.png" width="40" height="40">
						</td>
						<td class="table-bg" style="width: 20%;">
							<strong>20000</strong>원
						</td>
						<td class="table-bg" style="width: 20%;">
							<img src="/mgv/images/member/equal.png" width="40" height="40">
						</td>
						<td class="table-bg" style="width: 20%;">
							<strong style="font-size: large; color: red;">18000</strong>원
						</td>
					</tr>
				</tbody>	
			</table>
		</div>
	</div>
					
	<div class="row mb-3">
		<div class="col-12 text-end">
			<a href="order.jsp" class="btn btn-primary">쇼핑하기</a>
		</div>
	</div>
	
</div>
</body>
</html>