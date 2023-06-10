<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 URL - localhost/app4/student/form.jsp
	// 요청 URL - localhost/app4/student/form.jsp?err=dup
	String err = request.getParameter("err");
%>
<!doctype html>
<html lang="ko">
<head>
<title>
	회원가입 &#60; 회원서비스 | 영화 그 이상의 감동. MGV
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="../common/check.js"></script>

</head>
<body onLoad="document.form.id.focus()">
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="회원가입"/>
</jsp:include>
<div class="container-fluid">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">회원으로 등록하기</h1>
      	</div>
   	</div>
   	<div class="row mb-3">
   		<div class="col-12">
   			<p>사용자 정보를 입력하고 등록하세요.</p>
<%
	if ("dup".equals(err)) {
%>   			
			<div class="alert alert-danger">
				<strong>회원가입 실패</strong>아이디가 이미 사용중입니다.
			</div>
<%
	}
%>
	   			  <form class="bg-light needs-validation was-validated" name="form" method="post" action="insert.jsp" style="ailgn: center;" novalidate>
	   				<div class="form-group mb-2">
	   					<div class="form-check form-check-inline">
	  						<input class="form-check-input" type="radio" id="male" name="gender"  value="M" checked="checked">
	  						<label class="form-check-label" for="male">남성</label>
						</div>
						<div class="form-check form-check-inline">
	  						<input class="form-check-input" type="radio" id="female" name="gender" value="F">
	  						<label class="form-check-label" for="female">여성</label>
						</div>
	   				</div>
	   				<div class="form-group">
	   					<label class="form-label">아이디</label>
	   					<input type="text" class="form-control mb-2" id="id" name="id" style="width:300px" onKeyDown="key()" required>
	   					<div class="invalid-feedback">
			           		영문만 입력 가능
			        	</div>
	   				</div>
	   				<div class="form-group">
	   					<label for="pwd" class="form-label">비밀번호</label>
	   					<input type="password" class="form-control" id="pwd" name="password" style="width:300px" onKeyDown="key()" required>
	   					<div class="invalid-feedback">
			           		6자 이상 대문자나 소문자, 숫자를 포함해야 합니다.
			        	</div>
	   				</div>
	   				<div class="form-group">
	   					<label class="form-label">비밀번호 확인</label>
	   					<input type="password" class="form-control" id="repwd" name="checkPassword" style="width:300px" onKeyDown="key()" required>
	   					<div class="invalid-feedback">
			           		비밀번호를 다시 입력하세요.
			        	</div>
	   				</div>
	   				<div class="form-group mb-2 ">
	   					<label class="form-label">이름</label>
	   					<input type="text" class="form-control" id="name" name="name" style="width:300px" onKeyDown="key()" required>
	   					<div class="invalid-feedback">
			           		한글만 입력 가능 (공백, 영문 불가능)
			        	</div>
	   				</div>
	   				<div class="form-group mb-2 w-50">
	   					<label class="form-label">생년월일</label><br />
	   					<input type="date" class="form-control" id="birth" name="birth" style="width:300px" onKeyDown="key()" required>
	   				</div>
	   				<div class="form-group mb-2 ">
	   					<label class="form-label">휴대폰 번호</label><br />
	   					<input type="tel" class="form-control" maxlength="13" id="tel" name="tel" style="width:300px" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" onKeyDown="key()" placeholder="010-1234-5678" required>
	   					<div class="invalid-feedback">
			        	</div>
	   				</div>
	   				<div class="form-group row-2">
	   					<label class="form-label">이메일</label><br />
	   					<input type="email" class="form-control" id="email" name="email" style="width:300px" placeholder="name@example.com" onKeyDown="key()" required>
	   					<div class="invalid-feedback">
			           		@와 .이 포함되어야 합니다.
			        	</div>
	   				</div>
	   				<div class="form-group mb-2">
					 <label class="form-label">주소</label><br />
					 	<input type="text" class="form-input" maxlength="5" id="zipcode" name="zipcode" style="width:100px;" placeholder="우편번호" required> 
						<button type="button" id="btn" class="btn text-black btn-outline-primary btn-sm" >우편번호검색</button>
						<br /> 
					</div>
					<div class="form-group">
						<input type="text" class="form-control mb-3" name="address1" style="width:400px" placeholder="주소" readonly="readonly" >
						<input type="text" class="form-control" id="detailAddr" name="address2" style="width:300px" placeholder="상세주소" required>
					</div>
	   				<div class="form-group mb-3">
	   					<label class="form-label">추천인 ID</label><br />
	   					<input type="text" class="form-control" id="referee" name="referee" style="width:300px" placeholder="추천인 ID를 입력하세요."/>
	   				</div>
	   				<div class="text-center mb-3">
	   					<button type="submit" class="btn btn-primary" onclick="return join()">가입하기</button>
	   				</div>
	   			</form>
	   			
<script type="text/javascript">
function key(){ 
	//id에서 엔터나 ↓키를 누르면 아래로 커서 이동
	if(window.event.keyCode==13||window.event.keyCode==40){
    	document.log.pwd.focus();
   }
</script>
<!-- daum 우편번호찾기 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 우편번호찾기 -->
<script>
	
	const btn = document.querySelector("#btn");
	// 버튼을 클릭하면 daum.Postcode 함수 실행
	btn.addEventListener("click", () => {
    	new daum.Postcode({
        	oncomplete: function(data) {
				console.log(data); 
				// 전체 주소 변수 설정
				let fullAddr = '';
				// 추가 주소 변수 설정
				let extraAddr = '';
				
				// userSelectedType이 'R'(도로명주소)를 클릭했을 때 도로명 주소를 입력받고
				if (data.userSelectedType === 'R') {
					fullAddr = data.roadAddress;
				} else { // userSelectedType이 'R'이 아닌 경우는 지번 주소를 넣는다.
					fullAddr = data.jibunAddress;
				}
				
				// userSelectedType이 'R'(도로명주소)일 때
				if (data.userSelectedType === 'R') {
					// 법정동이 비어 있지 않는 경우 
					if (data.bname !== '') {
						extraAddr += data.bname;
					}
					// 건물명이 비어 있지 않는 경우
					if (data.buildingName !== '') {
						// extraAddr이 비어있지 않으면 ,로 연결해주고 건물명 넣고
						// bname(법정동)이 없으면 건물명을 바로 넣어준다.
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					
					// extraAddr 이 비어있지 않으면 좌우 ()로 싸고 없으면 빈 값을 반환한다.
					fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ') ' : '');
				}

				// 입력창에 우편번호 넣기
				document.form.zipcode.value = data.zonecode;
				// 입력창에 전체 주소 넣기
				document.form.address1.value = fullAddr;
				// 우편번호, 전체주소 입력되면 상세주소로 커서 이동
				document.form.address2.focus();
        	}
	    }).open();
	});
</script>
   		</div>
   	</div>
</div>
</body>
</html>