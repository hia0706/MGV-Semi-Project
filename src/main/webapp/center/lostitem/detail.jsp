<%@page import="vo.Lostitem"%>
<%@page import="dao.LostitemDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	int no = Integer.parseInt(request.getParameter("no"));
	
	LostitemDao lostitemDao = LostitemDao.getInstance();
	Lostitem lostitem = lostitemDao.getLostitemByNo(no);

	
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>

<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">문의글 상세 정보</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>문의글 상세정보를 확인하세요.</p>
			
			
			<table class="table table-bordered">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td><%=lostitem.getTitle() %></td>
						<th>등록일</th>
						<td><%=lostitem.getCreateDate() %></td>
					</tr>
					<tr>
						 <th>내용</th>
	                 	 <td colspan="4" style="height: 100px;"><%=lostitem.getContent() %></td>
              		</tr>
				</tbody>
			</table>
		
		</div>
	</div>
	
	
</div>

      
</div>
</body>
</html>










