<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
    
<title>
	MGV 고객센터
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="icon" href="/mgv/images/mgv.ico" type="images/x-icon">
</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>

<div class="container mt-3">
  <div class="row">
  	<div class="col-3">
    	 <div class="card">
         	<div class="card-header text-center" >고객센터</div>
    		
            	<div class="list-group">
  <a href="home.jsp" class="list-group-item list-group-item-action">고객센터 홈</a>
  <a href="lostitem/list.jsp" class="list-group-item list-group-item-action">분실물 문의</a>
  <a href="oneonone/insertform.jsp" class="list-group-item list-group-item-action">1:1 문의</a>
  <a href="faq/list.jsp" class="list-group-item list-group-item-action">자주 묻는 질문</a>
  <a href="notice/list.jsp" class="list-group-item list-group-item-action">공지사항</a>
</div>
        
  		</div>
    </div>
    <div class="col-9">
	<div class="row mb-3 bg-light p-3">
		<div class="col-3 text-center">
			<a href="lostitem/list.jsp" class="text-black text-decoration-none">
				<img src="../images/center/lostitem.png" width="50" height="50"><br>
				<strong>분실물 문의</strong>
			</a>		
		</div>
		<div class="col-3 text-center">
			<a href="oneonone/insertform.jsp" class="text-black text-decoration-none">
				<img src="../images/center/oneonone.png" width="50" height="50"><br>
				<strong>1:1 문의</strong>
			</a>
		</div>
		<div class="col-3 text-center">
			<a href="faq/list.jsp" class="text-black text-decoration-none">
				<img src="../images/center/faq.png" width="50" height="50"><br>
				<strong>자주 묻는 질문</strong>
			</a>
		</div>
		<div class="col-3 text-center">
			<a href="notice/list.jsp" class="text-black text-decoration-none">
				<img src="../images/center/notice.png" width="50" height="50"><br>
				<strong>공지사항</strong>
			</a>
		</div>
	</div>
	</div>	
	</div>
</div>
</body>
</html>