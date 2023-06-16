<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 회원아이디 가져오기
	String loginId = (String) session.getAttribute("loginId");
	// 요청파라미터 상품번호
	int productNo = Integer.parseInt(request.getParameter("no"));

	// 상품번호로 상품정보 가져오기
	ProductDao productDao = ProductDao.getInstance();
	Product product = productDao.getProductByNo(productNo);
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
<script type="text/javascript">
	$(function() {
		
		let count = 1;
		
		$('#plus').click(function() {
			$('#count').text(++count);
			changePrice();
		})
		
		$('#minus').click(function() {
			if (count > 1) {
				$('#count').text(--count);
			}
			changePrice();
		})
		
		function changePrice() {
			let price = document.querySelector("#price").textContent;
			let count = document.querySelector("#count").textContent;
			
			let totalPrice = price*count
			
			$("#totalPrice").text(totalPrice);
		}
		
	})
	
	function addCart(productNo) {
		let amount = document.getElementById("count").textContent;
		let totalPrice = document.getElementById("totalPrice").textContent;
		
		location.href = "../member/insertCart.jsp?no=" + productNo + "&amount=" + amount + "&totalPrice=" + totalPrice;

	}
	
</script>
</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="스토어"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2"><%=product.getName() %></h1>
			<p ><%=product.getDescription() %></p>
		</div>
	</div>
	<div>
		<img alt="상품별 사진" src="../images/products/<%=product.getNo() %>.png" class="img-thumnail" width="30%">
	</div>
	<div>
	<table class="table table-bordered ">
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="10%">
			<col width="40%">
		</colgroup>
		<tbody>
			<tr>
				<th>상품이름</th>
				<td><%=product.getName() %></td>
				<th>상품가격</th>
				<td><strong id="price"><%=product.getPrice() %></strong><strong>원</strong></td>
			</tr>
			<tr>
				<th>상품구성</th>
				<td id="productComposition"><%=product.getComposition() %></td>
				<th>구매 수량</th>
				<th class="align-middle">
					<button type="button" class="btn btn-outline-dark btn-sm" id="minus" title="수량감소" ><i class="bi bi-dash"></i></button>
						<span id="count">1</span>
					<button type="button" class="btn btn-outline-dark btn-sm" id="plus" title="수량증가"><i class="bi bi-plus"></i></button>
				</th>
			</tr>
			<tr>
				<th>총 금액</th>
				<th id="totalPrice"><%=product.getPrice() %></th>
			</tr>
		</tbody>
	</table>
	<div class="text-end">
		<button onclick="addCart(<%=product.getNo() %>)" class="btn btn-outline-secondary btn-sm" id="addCart">장바구니 담기</button>
		<a href="purchase.jsp" class="btn btn-outline-primary btn-sm" id="buy">바로 구매</a>
	</div>
	</div>
	<div class="box-pulldown">
			<button type="button" class="btn-toggle">
				구매 후 취소
			</button>
		<div class="dotList02">
		<br>       
            ■ 연장/취소/환불 안내<br>
			본 상품은 구매일로부터 10일 이내에 취소 가능합니다.<br>
			- 유효기간은 본 상품의 유효기간 내에서 연장 신청이 가능하며, 1회 연장 시 3개월(92일) 단위로 연장됩니다.<br>
			- 구매일로부터 5년까지 유효기간 연장이 가능합니다.<br>
			- 최초 유효기간 만료 후에는 결제금액의 90%에 대해 환불 요청 가능하며, 환불 처리에 7일 이상의 시간이 소요될 수 있습니다. (접수처: 1544-0070)<br>
			- 구매 취소 및 환불 요청은 미사용 상품에 한해 가능하며, 사용한 상품에 대해서는 불가합니다.<br>
			- 본 상품은 현금으로 환불이 불가합니다.<br>
			- 환불 요청한 포인트 중 소멸 포인트가 포함되어있다면 환불 요청한 월의 말일까지 사용 가능한 포인트로 돌아갑니다.<br>
			&nbsp;※ 2020년 2월 4일 이후 구매 상품에 한하여 유효기간 연장 신청이 가능합니다.
        </div>
	</div>
</div>
</body>
</html>