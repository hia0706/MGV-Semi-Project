<%@page import="vo.Oneonone"%>
<%@page import="dao.OneononeDao"%>
<%@page import="vo.Lostitem"%>
<%@page import="dao.LostitemDao"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>

<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="fs-2 p-2">자주 묻는 질문</h1>
      	</div>
   	</div>
	
		<hr>
			<a style="font-size : 17px;">영화 관람등급은 어떻게 되나요?<strong></strong></a><br>
			<a style="font-size : 12px;">2023.06.13</a>
		<hr>
			<a>
				<strong>전체 관람가</strong> : 모든 연령의 고객이 관람 가능<br><br>
 
				<strong>12세 이상 관람가</strong> : 만12세 이상(주민등록상 생일기준) 관람 가능<br>
				        				 만12세 미만 고객은 보호자(성인) 동반 시 관람 가능<br><br>
				
				<strong>15세 이상 관람가</strong> : 만15세 이상(주민등록상 생일기준) 관람 가능<br>
				                         만15세 미만 고객은 보호자(성인 동반 시 관람 가능<br><br>
				
				<strong>청소년 관람불가</strong> : 만18세 이상(주민등록상 생일기준) 관람 가능<br>
				                         -  만18세 이상이더라도 고등학교 재학중인 경우 관람 불가<br>
				                         - 신분증 지참 필수 (티켓 구매, 입장 시 신분증 확인 必)<br>
				                         만18세 미만 고객은 보호자(성인) 동반 시에도 관람 불가<br><br>

				<strong>* 보호자(성인) : 만 20세 이상의 성인</strong>
			</a>
		
		
			

      
</div>
</body>
</html>










