<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	
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
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="MEMBER"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">회원 상세 정보</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>회원 상세정보를 확인하세요</p>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="table-dark" style="width: 15%;">아이디</th>
						<td style="width: 35%;">hong</td>
						<th class="table-dark" style="width: 15%;">이름</th>
						<td style="width: 35%;">홍길동</td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">성별</th>
						<td style="width: 35%;">남성</td>
						<th class="table-dark" style="width: 15%;">생년월일</th>
						<td style="width: 35%;">900101</td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">연락처</th>
						<td style="width: 35%;">010-1234-1234</td>
						<th class="table-dark" style="width: 15%;">이메일</th>
						<td style="width: 35%;">hong@gmail.com</td>
					</tr>
					<tr>
						<th class="table-dark" style="width:20%;">주소</th>
						<td style="width: 10%;" colspan="3">15292, 경기 고양시 일산동구 호수로 596 (장항동, 엠비씨드림센터), 431-23</td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">가입일자</th>
						<td style="width: 85%;" colspan="3">2023-06-01</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12 text-end">
			<a href="orderlist.jsp" class="btn btn-outline-primary">구매내역</a>
			<a href="modify.jsp" class="btn btn-outline-warning">수정하기</a>
			<a href="enable.jsp" class="btn btn-outline-danger">탈퇴하기</a>
		</div>
	</div>
	
</div>
</body>
</html>