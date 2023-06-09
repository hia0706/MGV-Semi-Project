<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

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
<jsp:include page="../../admin/nav.jsp">
	<jsp:param name="menu" value="영화"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">신규 영화 등록</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>신규 영화 정보를 입력하세요.</p>
			<div class="border bg-light p-3">
				<form class="row g-3" method="post" action="insert.jsp">
	 				<div class="col-md-6">
						<label class="form-label">번호</label>
						<input type="text" class="form-control" name="no" />
					</div>
					<div class="col-md-6">
						<label class="form-label">순위</label>
						<input type="text" class="form-control" name="rank" />
					</div>
					<div class="col-md-12">
						<label class="form-label">제목</label>
						<input type="text" class="form-control" name="title" />
					</div>
					<div class="col-md-12">
						<label class="form-label">장르</label>
						<input type="text" class="form-control" name="genre" />
					</div>
					<div class="col-md-12">
						<label class="form-label">감독</label>
						<input type="text" class="form-control" name="director" />
					</div>
					<div class="col-md-12">
						<label class="form-label">배우</label>
						<input type="text" class="form-control" name="cast" />
					</div>
					<div class="col-md-12">
						<label class="form-label">설명</label>
						<textarea class="form-control" rows="5" name="description"></textarea>
					</div>
					<div class="col-md-12">
						<label class="form-label">개봉일</label>
						<input type="text" class="form-control" name="releaseDate" />
					</div>
					<div class="text-end">
						<a href="list.jsp" type="reset" class="btn btn-secondary btn-sm">취소</a>
						<button type="submit" class="btn btn-primary btn-sm">등록</button>
					</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>