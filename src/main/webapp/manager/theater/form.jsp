<%@page import="vo.Location"%>
<%@page import="java.util.List"%>
<%@page import="dao.LocationDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<%
	LocationDao locationDao = new LocationDao();
	List<Location> locations = locationDao.getLocations();
%>
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
<jsp:include page="../../manager-nav.jsp">
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
   					<label class="form-label">극장번호</label>
   					<input type="text" class="form-control" id="theater-name" name="tno" style="width:300px" placeholder="극장번호를 입력해주세요."/>
   				</div>
   				
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">극장명</label>
   					<input type="text" class="form-control" id="theater-name" name="name" style="width:300px" placeholder="극장명을 입력해주세요."/>
   				</div>
   				
   				<div class="form-group mb-2">
					<label class="form-label">지역 선택</label>
					<select class="form-select" name="lno">
<%
	for(Location location : locations){
%>
					<option value="<%=location.getNo() %>"><%=location.getName() %></option>
<%
	}
%>
					</select>
				</div>
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">극장 연락처</label>
   					<input type="text" class="form-control" id="member-repwd" name="tel" style="width:300px" placeholder="극장 연락처를 입력해주세요."/>
   				</div>
   				

   				<div class="form-group mb-2 w-75">
				 <label class="form-label">주소</label><br />
					<a id="btn" class="btn text-black btn-outline-primary btn-sm ">극장주소검색</a>
					<br /> 
				 <label class="form-label"></label><br />
					<input type="text" class="form-control" name="address1" style="width:400px" placeholder="도로명주소" readonly="readonly" />
					<input type="text" class="form-control" name="address2" style="width:300px" placeholder="지번주소" />
				</div>
   				

   				<div class="text-center mb-3">
   					<button type="submit" class="btn btn-primary">극장등록</button>
   					<button type="reset" class="btn btn-danger">취소</button>
   				</div>
   			</form>
   			
<!-- daum 주소 찾기 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소찾기 -->
<script>
	

const btn = document.querySelector("#btn");
// 버튼을 클릭하면 daum.Postcode 함수 실행
btn.addEventListener("click", () => {
	new daum.Postcode({
    	oncomplete: function(data) {
			console.log(data); 
			// 도로명 주소 변수 설정
			let fullAddr = '';
			// 지번 주소 변수 설정
			let parAddr = '';
			// 추가 주소 변수 설정
			let extraAddr = '';
			
			// userSelectedType이 'R'(도로명주소)를 클릭했을 때 도로명 주소를 입력받고
			if (data.userSelectedType === 'R') {
				fullAddr = data.roadAddress;
				parAddr = data.jibunAddress;
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

			// 입력창에 도로명주소 넣기
			document.form.address1.value = fullAddr;
			// 입력창에 전체 주소 넣기
			document.form.address2.value = parAddr;
			
    	}
    }).open();
});
</script>
   			
   		</div>
   	</div>
</div>
</body>
</html>