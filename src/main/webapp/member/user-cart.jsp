<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="vo.Cart"%>
<%@page import="java.util.List"%>
<%@page import="dao.CartDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	
	// 장바구니 상품들 가져오기
	CartDao cartDao = CartDao.getInstance();
	List<Cart> cartList = cartDao.getMyCarts(loginId);
	
	Cart ct = new Cart();
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	.box {
		text-align: center;
	}
</style>
<script type="text/javascript">
	function grandTotal() {
		let totalPrice = document.getElementById("totalPrice");
		totalPrice
		
	}
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
			<table class="table">
				<thead>
					<tr class="table-dark text-center">
						<th></th>
						<th>상품명</th>
						<th>판매금액</th>
						<th>수량</th>
						<th>구매금액</th>
						<th>취소</th>
					</tr>
				</thead>
				<tbody class="box">
<%
	for (Cart cart : cartList) {
%>
					<tr>
						<td><img alt="상품별 사진" src="../images/products/<%=cart.getProduct().getNo() %>.png" class="img-thumnail" width="150%"></td>
						<td id="productName" style="width: 20%; padding: 1em 0;"><%=cart.getProduct().getName() %></td>
						<td id="productPrice" style="width: 20%; padding: 1em 0;"><strong><%=cart.getProduct().getPrice() %></strong>원</td>
						<td id="amount" style="width: 20%; padding: 1em 0;"><%=cart.getAmount() %></td>
						<td id="totalPrice" style="width: 20%; padding: 1em 0;"><strong><%=cart.getTotalPrice() %></strong>원</td>
						<td style="width: 15%; padding: 1em 0;"><a href="deleteCartItem.jsp?no=<%=cart.getNo() %>" id="deleteItem"><i class="bi bi-trash link-dark"></i></a></td>
					</tr>
<%
	}
%>
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
					<tr class="table-dark">
						<th style="width: 20%" colspan="2">총 상품금액</th>
						<th style="width: 20%" colspan="2">할인금액</th>
						<th style="width: 20%;">총 결제금액</th>
					</tr>
					<tr>
						<td class="table" style="width: 20%;"><strong>60000</strong>원</td>
						<td class="table-bg" style="width: 20%;">
							<img src="/mgv/images/member/minus.png" width="40" height="40">
						</td>
						<td class="table-bg" style="width: 20%;">
							<strong>0</strong>원
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
			<a href="order.jsp" class="btn btn-success">결제</a>
		</div>
	</div>
	
</div>
</body>
</html>