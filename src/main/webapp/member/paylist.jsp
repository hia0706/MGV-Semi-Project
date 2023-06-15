<%@page import="org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="dao.PaymentDao"%>
<%@page import="vo.Payment"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String loginId = (String) session.getAttribute("loginId");
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);

	PaymentDao paymentDao = PaymentDao.getInstance();

	int totalRows = paymentDao.getTotalRowsById(loginId);
	Pagination pagination = new Pagination(pageNo, totalRows);
	
	List<Payment> payments = paymentDao.getAllPaymentsById(loginId, pagination.getBegin(), pagination.getEnd());
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>구매내역 &#60; 회원서비스 | 영화 그 이상의 감동. MGV</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp">
		<jsp:param name="menu" value="결제내역" />
	</jsp:include>
	<div class="container">
		<div class="row mb-3">
			<div class="col-12">
				<h1 class="border bg-light fs-4 p-2">구매 내역</h1>
			</div>
		</div>
		<div class="row mb-3">
			<div>
				<table >
					<tbody>
						<tr>
							<td>
							<label id="status" class="p-3">구분</label>
								<div class="form-check form-check-inline mb-2" id="status" onchange="refreshStatus();">
									<input class="form-check form-check-input" type="radio" name="status" id="all" value="" checked="checked">
									<label class="form-check-label" for="all">전체</label>
								</div>
								<div class="form-check form-check-inline" id="status" onchange="refreshStatusYes();">
									<input class="form-check form-check-input " type="radio" name="status" id="buy" value="Y">
									<label class="form-check-label" for="buy">구매내역</label>
								</div>
								<div class="form-check form-check-inline" id="status" onchange="refreshStatusNo();">
									<input class="form-check form-check-input " type="radio" name="status" id="cancel" value="N">
									<label class="form-check-label" for="cancel">취소내역</label>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="container mb-3">
		<div class="row mb-3">
			<div class="col-12">
				<p><%=loginId %>님의 결제내역을 확인하세요.</p>
					<div class="board-list-util">
						<p class="result-count"><strong>전체 <span id="total-rows" class="font-gblue"><%=totalRows %></span>건</strong></p>
					</div>
				
					<table class="table" id="table-payments">
						<thead>
							<tr class="table-dark">
								<th>결제일</th>
								<th>상품명</th>
								<th>결제금액</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
<%
	for (Payment pay : payments) {
%>
							<tr>
								<td><%=pay.getCreateDate() %></td>
								<td><a class="text-black text-decoration-none" href="../product/store.jsp?no=<%=pay.getProduct().getNo() %>"><%=pay.getProduct().getName() %></a></td>
								<td><%=pay.getPrice() %></td>
								<td>
<%
	if ("Y".equals(pay.getStatus())) {
%>						
							<span class="badge text-bg-success">구매완료</span>
<%
	} else if ("N".equals(pay.getStatus())) {
%>
							<span class="badge text-bg-danger">구매취소</span>
<%
	}	
%>								
								</td>
							</tr>
<%
	}
%>
						</tbody>
					</table>
					
					<nav>
						<ul class="pagination justify-content-center">
						<li class="page-item <%=pageNo <= 1 ? "disabled" : ""%>">
							<a href="paylist.jsp?page=<%=pageNo - 1 %>" class="page-link">이전</a>
						</li>
<%
	for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>				
						<li class="page-item <%=pageNo == num ? "active" : "" %>">
							<a href="paylist.jsp?page=<%=num %>" class="page-link"><%=num %></a>
						</li>

<%
	}
%>
					
						<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : ""%>">
							<a href="paylist.jsp?page=<%=pageNo + 1 %>" class="page-link">다음</a>
						</li>
					</ul>
					</nav>
				
					<div class="text-end">
						<a href="form.jsp" class="btn btn-warning btn-sm">장바구니</a>
						<a href="form.jsp" class="btn btn-primary btn-sm">스토어</a>
					</div>
				
			</div>
		</div>
	</div>
<script type="text/javascript">
	function refreshStatus() {
		// 값 조회
		let status = document.getElementById("status").value;
		
		// ajax 통신
		// 1. XMLHttpRequest 객체 생성하기
		let xhr = new XMLHttpRequest();
		// 2. XMLHttpRequest 객체 생성하기
		xhr.onreadystatechange = function() {
			// console.log("readyState", xhr.readyState);
			if (xhr.readyState === 4) {
				// 1. 응답 데이터 조회하기
				let data = xhr.responseText;
				
				// 2. 응답데이터를 객체로 변환
				let arr = JSON.parse(data);
				
				let htmlContent = "";
				arr.forEach(function(item, index)) {
					
				}
			}
		}
	}
</script>
</body>
</html>







