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
<script src="../common/check.js"></script>
<script src="../common/updatePostapi.js"></script>
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
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="MEMBER"/>
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
			
				<form class="border bg-light needs-validation was-validated p-3" id="form" method="post" action="modify.jsp"> 
					<div class="form-group mb-2">
						<label class="form-label">이름</label>
						<input type="text" class="form-control" name="name" value="<%=member.getName() %>" required>
					</div>
					<div class="form-group mb-2">
						<label class="form-label">비밀번호</label>
						<input type="password" class="form-control" name="password" value="<%=member.getPassword() %>" required>
					</div>
					<div class="form-group mb-2">
						<label class="form-label">생년월일</label><br /> 
						<input type="date" class="form-control" name="birth" value="<%=member.getBirth() %>" required>
					</div>
					<div class="form-group mb-2 ">
						<label class="form-label">휴대폰 번호</label><br /> 
						<input type="tel" class="form-control" maxlength="13" name="tel" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" value="<%=member.getTel() %>" required>
					</div>
					<div class="form-group mb-2">
						<label class="form-label">이메일</label><br /> 
						<input type="email" class="form-control" name="email" value="<%=member.getEmail() %>" required>
					</div>
					<div class="form-group">
						<label class="form-label">주소</label>
						<div class="form-group row">
							<div class="col-auto">
								<input type="text" class="form-control" maxlength="5" id="zipcode" name="zipcode" value="<%=member.getZipcode() %>" style="width: 150px">
							</div>
							<div class="col-auto">
								<button type="button" class="btn text-black btn-outline-primary btn-m mb-3" onclick="upPost();">우편번호검색</button>
							</div>
						</div>							
					</div>
					<div class="form-group row mb-2" >
						<div class="col-auto">
							<input type="text" class="form-control" id="address1" name="address1" value="<%=member.getAddress1() %>" readonly="readonly">
						</div>
						<div class="col-auto" >
							<input type="text" class="form-control" id="address2" name="address2" value="<%=member.getAddress2() %>" required>
						</div>
					</div>
					<div class="form-group mb-2">
						<label class="form-label">추천인</label>
						<input type="text" class="form-control" name="referee" value="<%=member.getReferee() == null ? "" : member.getReferee() %>" disabled />
					</div>
					<div class="form-group mb-2">
						<label class="form-label">수정일자</label>
						<input type="text" class="form-control mb-3" value="<%=member.getUpdateDate() %>" disabled/>
					</div>
					<div class="text-end mb-2 w-50">
						<button type="button" class="btn btn-secondary btn-m" onclick="goBack();">이전</button>								
						<button type="submit" class="btn btn-primary btn-m">수정</button>
					</div>
				</form>
			</div>	
			
		</div>
	</div>
</div> 
</body>
</html>