<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	// 요청 URL - localhost/app4/student/form.jsp
	// 요청 URL - localhost/app4/student/form.jsp?err=dup
	String err = request.getParameter("err");
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>회원가입 &#60; 회원서비스 | 영화 그 이상의 감동. MGV</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="/mgv/images/mgv.ico" type="images/x-icon">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="../common/check.js"></script>
<script src="../common/postapi.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	container {
		max-width: 800px;
		margin: 15px 25px 15px 0px; 
		padding: 10px;
	}
	#box {
		margin: 15px 25px 15px 0px; 
		padding: 10px;
	}
</style>
</head>
<body onLoad="document.form.id.focus()">
	<jsp:include page="../../common/nav.jsp">
		<jsp:param name="menu" value="회원가입" />
	</jsp:include>
	<div class="container">
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
				<div id="box">
					<form class="bg-light needs-validation was-validated p-3" name="form" method="post" action="insert.jsp" novalidate>
						<div class="form-group mb-2">
							<div class="form-check form-check-inline ">
								<input class="form-check-input" type="radio" id="male" name="gender" value="남성" checked="checked"> 
									<label class="form-check-label" for="male">남성</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" id="female" name="gender" value="여성"> 
								<label class="form-check-label mb-2" for="female">여성</label>
							</div>
					<div class="row row-cols-auto">
						</div>
							<div class="form-group mb-2">
								<label class="form-label">아이디</label> 
								<input type="text" class="form-control mb-2" id="id" name="id" style="width: 300px" required>
								<div class="invalid-feedback">
									4자 이상 영문,숫자만 입력 가능
								</div>
							</div>
							
							<div class="form-group mb-2 row">
								<div class="col-auto">
									<label for="pwd" class="form-label">비밀번호</label> 
									<input type="password" class="form-control" id="pwd" name="password" style="width: 300px" required>
									<div class="invalid-feedback">
										6자 이상 대, 소문자, 숫자를 포함해야 합니다.
									</div>
								</div>
								
								<div class="col-auto">
									<div class="form-group mb-2">
										<label class="form-label">비밀번호 확인</label> 
										<input type="password" class="form-control" id="repwd" name="checkPassword" style="width: 300px" required>
										<div class="invalid-feedback">
											비밀번호를 다시 입력하세요.
										</div>
									</div>
								</div>
							</div>
							
							<div class="form-group mb-2 ">
								<label class="form-label">이름</label> 
								<input type="text" class="form-control" id="name" name="name" style="width: 300px" required>
								<div class="invalid-feedback">
									한글만 입력 가능 (공백, 영문 불가능)
								</div>
							</div>
							
							<div class="form-group mb-2">
								<label class="form-label">생년월일</label><br /> 
								<input type="date" class="form-control" id="birth" name="birth" style="width: 300px" required>
							</div>
							
							<div class="form-group mb-2 ">
								<label class="form-label">휴대폰 번호</label><br /> 
								<input type="tel" class="form-control" maxlength="13" id="tel" name="tel" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" style="width: 300px" required>
								<div class="invalid-feedback">
									010-1234-5678
								</div>
							</div>
							
							<div class="form-group mb-2">
								<label class="form-label">이메일</label><br /> 
								<input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" style="width: 300px" required>
								<div class="invalid-feedback">
									name@example.com
								</div>
							</div>
							
							<div class="form-group mb-2">
								<label class="form-label">주소</label><br /> 
								<div class="form-group row">
									<div class="col-auto">
										<input type="text" class="form-control" maxlength="5" id="zipcode" name="zipcode" style="width: 150px" readonly="readonly">
										<div class="invalid-feedback">
											우편번호를 검색하세요
										</div>
									</div>
									<div class="col-auto mb-2">
										<input type="button" id="btn" class="btn text-black btn-outline-primary btn-m mb-3" value="우편번호검색" onclick="post();" />
									</div>
								</div>							
							</div>
	
							<div class="form-group row" >
								<div class="col-auto">
									<input type="text" class="form-control" id="Addr" name="address1" style="width: 400px" placeholder="주소" readonly="readonly">
								</div>
								<div class="col-auto" >
									<input type="text" class="form-control" id="detailAddr" name="address2" style="width: 300px" required>
									<div class="invalid-feedback">
										상세주소를 입력하세요
									</div>
								</div>
							</div>
							
							<div class="form-group mb-2">
								<label class="form-label">추천인 ID</label><br /> <input
									type="text" class="form-control mb-2" id="referee" name="referee" style="width: 300px" placeholder="추천인 ID를 입력하세요." />
							</div>
							<div class="text-center mb-3">
								<button type="submit" class="btn btn-primary mb-3" onclick="return join()">가입하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>