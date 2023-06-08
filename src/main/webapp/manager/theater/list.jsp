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
<jsp:include page="../../manager/nav.jsp">
	<jsp:param value="manu" name="극장"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">극장 목록</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>극장 목록을 확인하세요.</p>
			<table class="table">
				<thead>
					<tr class="table-dark">
						<th style="width: 10%;">번호</th>
						<th style="width: 15%;">지역</th>
						<th style="width: 20%;">극장명</th>
						<th style="width: 10%;"></th>
					</tr>
				</thead>
				<tbody>
					<tr class="align-middle">
						<td>101</td>
						<td>서울</td>
						<td>서울 MGV</td>
						<td><a href="detail.jsp?no=101" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
					<tr class="align-middle">
						<td>101</td>
						<td>서울</td>
						<td>서울 MGV</td>
						<td><a href="detail.jsp?no=101" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
					<tr class="align-middle">
						<td>101</td>
						<td>서울</td>
						<td>서울 MGV</td>
						<td><a href="detail.jsp?no=101" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
					<tr class="align-middle">
						<td>101</td>
						<td>서울</td>
						<td>서울 MGV</td>
						<td><a href="detail.jsp?no=101" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="text-end">
    	<a href="form.jsp" class="btn btn-primary btn-sm">새 극장 등록</a>
    </div>
	
	<div class="row mb-3">
		<div class="col-12">
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link disabled" href="course-list.jsp?page=1">이전</a></li>
					<li class="page-item"><a class="page-link active" href="course-list.jsp?page=1">1</a></li>
					<li class="page-item"><a class="page-link" href="course-list.jsp?page=2">2</a></li>
					<li class="page-item"><a class="page-link" href="course-list.jsp?page=3">3</a></li>
					<li class="page-item"><a class="page-link" href="course-list.jsp?page=4">4</a></li>
					<li class="page-item"><a class="page-link" href="course-list.jsp?page=5">5</a></li>
					<li class="page-item"><a class="page-link" href="course-list.jsp?page=2">다음</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
</body>
</html>