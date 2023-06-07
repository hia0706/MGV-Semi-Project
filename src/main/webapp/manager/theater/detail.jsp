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
	<jsp:param value="menu" name="극장"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">극장 상세 정보</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>극장 상세정보를 확인하세요</p>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="table-dark" style="width: 15%;">극장이름</th>
						<td style="width: 35%;">서울 MGV</td>
						<th class="table-dark" style="width: 15%;">번호</th>
						<td style="width: 35%;">101</td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">지역</th>
						<td style="width: 35%;">서울</td>
						<th class="table-dark" style="width: 15%;">일반주소</th>
						<td style="width: 35%;">일반주소</td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">도로명주소</th>
						<td style="width: 35%;">도로명주소</td>
						<th class="table-dark" style="width: 15%;">극장 연락처</th>
						<td style="width: 35%;">02-111-1111</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="text-end">
				<a href="delete.jsp?no=101" class="btn btn-danger btn-sm">삭제</a>
				<a href="reapply.jsp?no=101" class="btn btn-danger btn-sm">복구</a>				
				<a href="modifyform.jsp?no=101" class="btn btn-warning btn-sm">수정</a>
				<a href="list.jsp" class="btn btn-primary btn-sm">목록</a>
	</div>
</div>
</body>
</html>