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
	int grandTotal = 0;
	int discountPrice = 0;
	int payment = 0;
	
	for (Cart cart : cartList) {
		grandTotal += cart.getTotalPrice();
		discountPrice += cart.getTotalPrice()*0.1;
		payment = grandTotal - discountPrice;
%>
					<tr>
						<td><img alt="상품별 사진" src="../images/products/<%=cart.getProduct().getNo() %>.png" class="img-thumnail" width="150%" style="padding: 0.5em 0;"></td>
						<td id="product-name" style="width: 20%; padding: 2em 0;"><%=cart.getProduct().getName() %></td>
						<td id="product-price" style="width: 20%; padding: 2em 0;"><strong><%=cart.getProduct().getPrice() %></strong>원</td>
						<td id="amount" style="width: 20%; padding: 2em 0;"><%=cart.getAmount() %></td>
						<td style="width: 20%; padding: 2em 0;"><strong><span id="total-price"><%=cart.getTotalPrice() %></span></strong>원</td>
						<td style="width: 15%; padding: 2em 0;"><a href="deleteCartItem.jsp?no=<%=cart.getNo() %>" id="delete-item"><i class="bi bi-trash link-dark"></i></a></td>
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
					<tr class="table-dark text-center">
						<th style="width: 20%">총 상품금액</th>
						<th></th>
						<th style="width: 20%">할인금액</th>
						<th></th>
						<th style="width: 20%;">총 결제금액</th>
					</tr>
					<tr class="text-center">
						<td id="grand-total" class="table" style="width: 20%; padding: 1em 1em;"><strong><%=grandTotal %>원</strong></td>
						<td class="table-bg" style="width: 20%;">
							<img src="/mgv/images/member/minus2.png" width="40" height="40">
						</td>
						<td class="table-bg" style="width: 20%; padding: 1em 2em;">
							<strong style="font-size: large; color: red;"><%=discountPrice %></strong><strong>원</strong>
						</td>
						<td class="table-bg" style="width: 20%;">
							<img src="/mgv/images/member/equal2.png" width="40" height="40">
						</td>
						<td class="table-bg" style="width: 20%; padding: 1em 2em;">
							<strong id="payment" style="font-size: large; color: blue;"><%=payment %></strong>원
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