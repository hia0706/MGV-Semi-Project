<%@page import="dto.Pagination1"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="dao.PaymentDao"%>
<%@page import="vo.Payment"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("../login/form.jsp?err=req&job=" + URLEncoder.encode("결제내역", "utf-8"));
		return;
	}
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);

	PaymentDao paymentDao = PaymentDao.getInstance();

	int totalRows = paymentDao.getTotalRowsById(loginId);
	
	Pagination1 pagination = new Pagination1(pageNo, totalRows);
	
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
	label {
		text-align: bottom;
	}
	
</style>
</head>
<body>
	<jsp:include page="../../common/nav.jsp">
		<jsp:param name="menu" value="결제내역" />
	</jsp:include>
	<div class="container">
		<div class="row mb-3">
			<div class="col-12">
				<h1 class="border bg-light fs-4 p-2">결제 내역</h1>
			</div>
		</div>
		<div class="row mb-3">
			<div>
				<table >
					<tbody>
						<tr>
							<td>
								<div>
									<div class="form-check form-check-inline mb-2">
										<input class="form-check form-check-input me-2" type="radio" name="status" onchange="refreshPayment('all');" value="all" checked="checked" >전체
									</div> 
									<div class="form-check form-check-inline mb-2">
										<input class="form-check form-check-input me-2" type="radio" name="status" onchange="refreshPayment('Y');" value="Y">구매내역
									</div> 
									<div class="form-check form-check-inline mb-2">
										<input class="form-check form-check-input me-2" type="radio" name="status" onchange="refreshPayment('N');" value="N">취소내역
									</div>
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
				<p><strong style="font-size: 18px; color: blue;"><%=loginId %></strong>님의 결제내역을 확인하세요.</p>
					<div class="board-list-util">
						<p class="result-count">
							<strong>전체 <span id="total-rows" class="font-gblue"><%=totalRows %></span>건
							</strong>
						</p>
					</div>
				
					<table class="table" id="table-payments">
						<thead>
							<tr class="table-dark">
								<th>결제번호</th>
								<th>결제일</th>
								<th>상품명</th>
								<th>결제금액</th>
								<th>상태</th>
								<th></th>
							</tr>
						</thead>
						<tbody>		
<%
	for (Payment pay : payments) {
%>
							<tr>
								<td><%=pay.getNo() %></td>
								<td><a class="text-black text-decoration-none" href="/mgv/store/detail.jsp?no=<%=pay.getProduct().getNo() %>">
									<%=pay.getProduct().getName() %></a></td>
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
									<td >
<%
		if ("N".equals(pay.getStatus())) { /* 구매취소만 삭제 */
%>								
												<a href="delete.jsp?no="<%=pay.getNo() %>>
											<img src="/mgv/images/member/trash.png" style="width: 20px; height: 20px;"/></a>
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
						<a href="../user-cart.jsp" class="btn btn-warning btn-sm">장바구니</a>
						<a href="../../store/store.jsp" class="btn btn-primary btn-sm">스토어</a>
					</div>
				
			</div>
		</div>
	</div>
<script type="text/javascript">
	let checkedStatus = "all";
	
	function refreshPayment(status) { // status 는 All, Y, N 중 하나다.
		checkedStatus = status;
		getData(1);
	}
	
	function goPage(e, pageNo) {
		e.preventDefault();
		getData(pageNo);
	}
	function getData(pageNo) {
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				let text = xhr.responseText;
				let obj = JSON.parse(text);
				
				document.getElementById("total-rows").textContent = obj.totalRows;
				let payments = obj.payments;
				let pagination = obj.pagination;
				
				let htmlContents = '';
				
				payments.forEach(function(item, index) {
					htmlContents += `
						<tr>
							<td>\${item.no}</td>
							<td>\${item.createDate}</td>
							<td><a class="text-black text-decoration-none" href="/mgv/store/detail.jsp?no=${item.product.no}">\${item.product.name}</td>
							<td>\${item.price}</td>
							<td>\${item.status === "Y" ? `<span class="badge text-bg-success">구매완료</span>` 
													   : `<span class="badge text-bg-danger">구매취소</span>`}</td>
              				<td>\${item.status === "N" ? `<a href="/mgv/member/buy/delete.jsp?no=\${item.no}">
                                    <img src="/mgv/images/member/trash.png" style="width: 20px; height: 20px;"/></a>` : ''}</td>
						</tr>
					`;
				});
				
				document.querySelector("#table-payments tbody").innerHTML = htmlContents;
				
				let paginationHtmlContent = `<nav>   
					<ul class="pagination justify-content-center">
					<li class="page-item \${pagination.page <= 1 ?  'disabled' : ''}">
						<a href="paylist.jsp?page=\${pagination.pageNo -1}" onclick="goPage(event, \${pagination.page -1})" class="page-link">이전</a>
					</li>`;
			
				for (let num = pagination.beginPage; num <= pagination.endPage; num++) {
					
					paginationHtmlContent += `<li class="page-item \${pagination.page == num ? 'active' : ''}">
												<a href="paylist.jsp?page=\${num}" onclick="goPage(event, \${num})" class="page-link">\${num}</a>
											  </li>`;

				}
				
				paginationHtmlContent += `<li class="page-item \${pagination.pageNo >= pagination.totalRows ? 'disabled' : ''}">
					<a href="paylist.jsp?page=\${pagination.page + 1}" onclick="goPage(event, \${pagination.page + 1})" class="page-link">다음</a>
					  </li>
					</ul>
				</nav>`
				
				document.querySelector(".pagination").innerHTML = paginationHtmlContent;

			}	
		};
		xhr.open("GET", "payment.jsp?status=" + checkedStatus + "&page=" + pageNo);
		xhr.send(null);
	}
</script>
</body>
</html>







