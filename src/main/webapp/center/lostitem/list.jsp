<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
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
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .40rem; --bs-btn-padding-x: .7rem; --bs-btn-font-size: .95rem;}
	
	table {
	   text-align: center;
	}
	
</style>
</head>
<body>

<%--
<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>
--%>

<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="fs-2 p-2">분실물 문의</h1>
      	</div>
   	</div>
	<div class="clearfix">
		<ul class="dot-list">
			<li>
				MGV에서 잃어버린 물건이 있다면 ‘분실물 문의/접수’를 통해 접수해주세요.
				<a href="insertform.jsp" class="btn btn-outline-dark btn-xs" style="float:right;">분실물 문의</a>
			</li>
			<li>접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.</li>
		</ul>
			
			<table class="table">
				<thead>
					<tr class="table-light"> 
						<th style="width: 5%;">번호</th>
						<th style="width: 10%;">극장</th>
						<th style="width: 50%;">제목</th>
						<th style="width: 10%;">접수상태</th>
						<th style="width: 10%;">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>극장</td>
						<td style="text-align:left">새로 개봉한 코난 극장판 보러갔다가 제가 아끼는 초호기 피규어를 잃어버려서 가슴이 무너집니다.</td>
						<td>미답변</td>
						<td>2023.06.11</td>
					</tr>
					<tr>
						<td>2</td>
						<td>극장</td>
						<td style="text-align:left">새로 개봉한 코난 극장판 보러갔다가 제가 아끼는 초호기 피규어를 잃어버려서 가슴이 무너집니다.</td>
						<td>미답변</td>
						<td>2023.06.11</td>
					</tr>
					<tr>
						<td>3</td>
						<td>극장</td>
						<td style="text-align:left">새로 개봉한 코난 극장판 보러갔다가 제가 아끼는 초호기 피규어를 잃어버려서 가슴이 무너집니다.</td>
						<td>미답변</td>
						<td>2023.06.11</td>
					</tr>
					<tr>
						<td>4</td>
						<td>극장</td>
						<td style="text-align:left">새로 개봉한 코난 극장판 보러갔다가 제가 아끼는 초호기 피규어를 잃어버려서 가슴이 무너집니다.</td>
						<td>미답변</td>
						<td>2023.06.11</td>
					</tr>
					<tr>
						<td>5</td>
						<td>극장</td>
						<td style="text-align:left">새로 개봉한 코난 극장판 보러갔다가 제가 아끼는 초호기 피규어를 잃어버려서 가슴이 무너집니다.</td>
						<td>미답변</td>
						<td>2023.06.11</td>
					</tr>
				</tbody>
			</table>
	</div>
</div>
</body>
</html>