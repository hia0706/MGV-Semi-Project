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
<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="극장"/>
</jsp:include>
<div class="container" style="max-width: 600px;">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">극장 등록하기</h1>
      	</div>
   	</div>
   	<div class="row mb-3">
   		<div class="col-12">
   			<p>극장 정보를 입력하고 등록하세요.</p>

   			<form class="border bg-light p-2" name="form" method="post" action="insert.jsp">
   				
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">극장명</label>
   					<input type="text" class="form-control" id="theater-name" name="name" style="width:300px" placeholder="극장명 입력해주세요."/>
   				</div>
   				
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">지역</label>
   					<input type="text" class="form-control" id="theater-location" name="" style="width:300px" placeholder="지역 입력해주세요."/>
   				</div>
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">극장 연락처</label>
   					<input type="text" class="form-control" id="member-repwd" name="checkPassword" style="width:300px" placeholder="극장 연락처를 입력해주세요."/>
   				</div>
   				
   				<div class="form-group mb-2 w-75">
				 <label class="form-label">주소</label><br />
				 	<input type="text" maxlength="5" id="zipcode" name="zipcode" style="width:100px" placeholder="" readonly="readonly" /> 
					<a id="btn" class="btn text-black btn-outline-primary btn-sm ">극장주소검색</a>
					<br /> 
				 <label class="form-label"></label><br />
					<input type="text" class="form-control" name="address1" style="width:400px" placeholder="주소" readonly="readonly" />
					<input type="text" class="form-control" name="address2" style="width:300px" placeholder="상세주소" />
				</div>
   				

   				<div class="text-center mb-3">
   					<button type="submit" class="btn btn-primary">회원가입</button>
   					<button type="submit" class="btn btn-danger">취소</button>
   				</div>
   			</form>
   			
<!-- daum 우편번호찾기 api -->
<script type="text/javascript">

</script>
   			
   		</div>
   	</div>
</div>
</body>
</html>