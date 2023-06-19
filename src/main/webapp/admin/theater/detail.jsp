<%@page import="vo.Theater"%>
<%@page import="dao.TheaterDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//파라미터 극장번호
	int theaterNo = Integer.parseInt(request.getParameter("no"));
	//극장번호로 극장정보 가져오기
	TheaterDao theaterDao = TheaterDao.getInstance();
	Theater theater = theaterDao.getTheaterByNo(theaterNo);
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>극장 상세페이지 &#60; 극장 관리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../admin/nav.jsp">
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
						<td style="width: 35%;"><%=theater.getName() %></td>
						<th class="table-dark" style="width: 15%;">번호</th>
						<td style="width: 35%;"><%=theater.getNo() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">지역</th>
						<td style="width: 35%;"><%=theater.getLocation().getName() %></td>
						<th class="table-dark" style="width: 15%;">연락처</th>
						<td style="width: 35%;"><%=theater.getTel() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">주소</th>
						<td colspan="3" style="width: 35%;"><%=theater.getAddress() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">주차정보</th>
						<td colspan="3" style="width: 35%;"><%=theater.getParkingInfo() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">주차요금</th>
						<td colspan="3" style="width: 35%;"><%=theater.getParkingFee() %></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="text-end">
	

<%
	if("N".equals(theater.getDisabled())){
%>				
				<a href="delete.jsp?no=<%=theater.getNo() %>" class="btn btn-danger btn-sm">삭제</a>
<%}else{ %>				
				<a href="reapply.jsp?no=<%=theater.getNo() %>" class="btn btn-danger btn-sm">복구</a>
<%} %>								
				<a href="modifyform.jsp?no=<%=theater.getNo() %>" class="btn btn-warning btn-sm">수정</a>
				<a href="list.jsp" class="btn btn-primary btn-sm">목록</a>
	</div>
</div>
</body>
</html>