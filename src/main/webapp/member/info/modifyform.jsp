<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="javax.swing.RepaintManager"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(loginId);
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/mgv.ico" type="images/x-icon">
<title> 
	회원 정보 수정 &#60; 회원서비스 | 영화 그 이상의 감동. MGV
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/mgv/common/checkUpdate.js"></script>
<script src="/mgv/common/postapi.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	#box {
		margin: 15px 25px 15px 0px; 
		padding: 10px;
	}
	#box form {
		display: block;
	}
	#box div > input {
		width: 400px;
	}
</style>
</head>
<body>
<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="<%=loginId %>"/>
</jsp:include>
<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
</script>
<div id="box">
	<div class="container">
		<div class="row mb-3">
			<div class="col-12">
				<h1 class="border bg-light fs-4 p-2">회원 정보 수정</h1>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-12">
				<p>회원 정보를 확인하고, 수정하세요.</p>
			
				<form class="border bg-light needs-validation was-validated p-3" id="form" method="post" action="modify.jsp" novalidate> 
					<div class="form-group mb-2">
						<label class="form-label">이름</label>
						<input type="text" class="form-control" id="name" name="name" value="<%=member.getName() %>" required>
						<div class="invalid-feedback">
							한글만 입력 가능 (공백, 영문 불가능)
						</div>
					</div>
					<div class="form-group mb-2">
						<label class="form-label">비밀번호</label>
						<input type="password" class="form-control" id="pwd" name="password" value="<%=member.getPassword() %>" required>
						<div class="invalid-feedback">
							6자 이상 대, 소문자, 숫자를 포함해야 합니다.
						</div>
					</div>
					<div class="form-group mb-2">
						<label class="form-label">생년월일</label><br /> 
						<input type="date" class="form-control" id="birth" name="birth" max="2023-06-20" value="<%=member.getBirth() %>" disabled>
					</div>
					<div class="form-group mb-2 ">
						<label class="form-label">휴대폰 번호</label><br /> 
						<input type="tel" class="form-control" id="tel" maxlength="13" name="tel" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" value="<%=member.getTel() %>" required>
						<div class="invalid-feedback">
							010-1234-5678
						</div>
					</div>
					<div class="form-group mb-2">
						<label class="form-label">이메일</label><br /> 
						<input type="email" class="form-control" id="email" name="email" value="<%=member.getEmail() %>" required>
						<div class="invalid-feedback">
							name@example.com
						</div>
					</div>
					<div class="form-group">
						<label class="form-label">주소</label>
						<div class="form-group row">
							<div class="col-auto">
								<input type="text" class="form-control" id="zipcode" maxlength="5" id="zipcode" name="zipcode" value="<%=member.getZipcode() %>" style="width: 150px">
								<div class="invalid-feedback">
									우편번호를 검색하세요
								</div>
							</div>
							<div class="col-auto">
								<button type="button" class="btn text-black btn-outline-primary btn-m mb-3" onclick="post();">우편번호검색</button>
							</div>
						</div>							
					</div>
					<div class="form-group row mb-2" >
						<div class="col-auto">
							<input type="text" class="form-control" id="Addr" name="address1" value="<%=member.getAddress1() %>" readonly="readonly">
						</div>
						<div class="col-auto" >
							<input type="text" class="form-control" id="detailAddr" name="address2" value="<%=member.getAddress2() %>" required>
							<div class="invalid-feedback">
								상세주소를 입력하세요
							</div>
						</div>
					</div>
					<div class="form-group mb-2">
						<label class="form-label">추천인</label>
						<input type="text" class="form-control" id="referee" name="referee" value="<%=member.getReferee() == null ? "" : member.getReferee() %>" disabled />
					</div>
					<div class="form-group mb-2">
						<label class="form-label">수정일자</label>
						<input type="text" class="form-control mb-3" value="<%=member.getUpdateDate() %>" disabled/>
					</div>
					<div class="text-end mb-2 w-50">
						<button type="button" class="btn btn-secondary btn-m" onclick="goBack();">이전</button>								
						<button type="submit" class="btn btn-primary btn-m" onclick="return join()">수정</button>
					</div>
				</form>
			</div>	
			
		</div>
	</div>
</div> 
</body>
</html>