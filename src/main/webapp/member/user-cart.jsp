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
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<style type="text/css">
	.box {
		text-align: center;
	}
</style>
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
	int countPrice = -1;
	
	for (Cart cart : cartList) {
		grandTotal += cart.getTotalPrice();
		discountPrice += cart.getTotalPrice()*0.1;
		payment = grandTotal - discountPrice;
		countPrice += 1;

%>
					<tr>
						<td><img alt="상품별 사진" src="../images/products/<%=cart.getProduct().getNo() %>.png" class="img-thumnail" width="150%" style="padding: 0.5em 0;"></td>
						<td style="width: 20%; padding: 2em 0;"><a href="../store/detail.jsp?no=<%=cart.getProduct().getNo() %>" class="link-dark" style="text-decoration: none"><%=cart.getProduct().getName() %></a></td>
						<td style="width: 20%; padding: 2em 0;"><strong id="product-price"><%=cart.getProduct().getPrice() %></strong>원</td>
						<td style="width: 20%; padding: 2em 0;">
								<span id="amount"><%=cart.getAmount() %></span>
						</td>
						<td style="width: 20%; padding: 2em 0;"><strong><span id="total-price"><input type="hidden" name="price" value="<%=cart.getTotalPrice() %>" /><%=cart.getTotalPrice() %></span></strong>원</td>
						
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
						<td id="grand-total" class="table" style="width: 20%; padding: 1em 1em;"><strong><%=grandTotal %></strong>원</td>
						<td class="table-bg" style="width: 20%;">
							<img src="/mgv/images/member/minus2.png" width="40" height="40">
						</td>
						<td class="table-bg" style="width: 20%; padding: 1em 2em;">
							<strong style="font-size: large; color: black;"><%=discountPrice %></strong>원
						</td>
						<td class="table-bg" style="width: 20%;">
							<img src="/mgv/images/member/equal2.png" width="40" height="40">
						</td>
						<td class="table-bg" style="width: 20%; padding: 1em 2em;">
							<strong style="font-size: large; color: red;"><%=payment %></strong>원
						</td>
					</tr>
				</tbody>	
			</table>
		</div>
	</div>
					
	<div class="row mb-3">
		<div class="col-12 text-end">
			<button onclick="payment();" id="payment-button" class="btn btn-sm btn-primary">결제하기</button>
		</div>
	</div>
	
</div>
<script>
    const clientKey = 'test_ck_Lex6BJGQOVDY7zZDAQOrW4w2zNbg' // 테스트용 클라이언트 키
    const customerKey = 'DOVMZxZag5_walYjj30Dr' // 고객을 식별할 수 있는 키
    // 2. 결제위젯 SDK 초기화
    const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
    // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제

	paymentWidget.renderPaymentMethods('#payment-method',
		  {
		    value: <%=payment %>,
		    currency: 'KRW',
		    country: 'KR',
		  },
		  { variantKey: 'widgetA' }
		)

		function payment() {
		  	paymentWidget.requestPayment({
		  	orderId: 'DOVMZxZag5_walYjj30Dr',
<%
	for (Cart cart : cartList) {
%>
		  	orderName: '<%=cart.getProduct().getName() %> 외 <%=countPrice %>건',
<%
	}
%>
		 	successUrl: 'http://localhost/mgv/member/updateCart.jsp',
		 	failUrl: 'http://localhost:8080/fail',
			})
		}

</script>
</body>
</html>








