<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="vo.TheaterBoard"%>
<%@page import="vo.Theater"%>
<%@page import="dao.TheaterDao"%>
<%@page import="vo.Location"%>
<%@page import="java.util.List"%>
<%@page import="dao.LocationDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	// 세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");
	
	if(loginId == null){
		response.sendRedirect("../../member/loginform.jsp?err=req&job=" + URLEncoder.encode("게시물수정", "utf-8"));
		return;
	}

	
	int boardNo = Integer.parseInt(request.getParameter("no"));
	
	LocationDao locationDao = LocationDao.getInstance();
	List<Location> locations = locationDao.getLocations();
	
	TheaterDao theaterDao = TheaterDao.getInstance();
	List<Theater> theaters = theaterDao.getAllTheaters();
	
	// 다른사용자의 게시물을 수정하려 시도했을시 에러메세지 출력
	TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
	TheaterBoard theaterBoard = theaterBoardDao.getTheaterBoardByNo(boardNo);	
	if (!theaterBoard.getMember().getId().equals(loginId)){
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id&job="+URLEncoder.encode("수정", "utf-8"));
	}

	int locationNo = theaterBoard.getLocation().getNo();
	int theaterNo = theaterBoard.getTheater().getNo();
	String grade = theaterBoard.getGrade();
	String score = "";
	if (grade.equals("A")){
		score = "★★★★★";
	} else if (grade.equals("B")){
		score = "★★★★☆";
	} else if (grade.equals("C")){
		score = "★★★☆☆";
	} else if (grade.equals("D")){
		score = "★★☆☆☆";
	} else if (grade.equals("E")){
		score = "★☆☆☆☆";
	}
%>
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
	<jsp:param name="menu" value="게시판"/>
</jsp:include>

<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
         	<h1 class="border bg-light fs-4 p-2">게시글 수정폼</h1>
      	</div>
	</div>  
	<div class="row mb-3">
		<div class="col-12">
			<p>제목과 내용을 입력하세요</p>		
			<form class="border bg-light p-3" method="post" action="modify.jsp" >
				<input type="hidden" name="no" value="<%=boardNo %>">
				<div class="form-group mb-2">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="name" value="<%=theaterBoard.getName() %>"/>
				</div>

				<div class="txc-textbox" style="background-color:#FAFAFA; border:#FFFFFF 4px solid; border-radius: 5px; width: 33%; padding:10px; float: left;" >
					<label class="form-label">별점은 변경하실 수 없습니다.</label>
					<p>별점 : <%=score %></p>
				</div>				
								
				<div class="form-group mb-2" style="float: left; width: 33%; padding:10px;">
					<label class="form-label">지역</label>
					<select class="form-select" name="locationNo" id="locationNo" onchange="refreshTh();">
						<option value="" selected disabled>지역 선택</option>
<%			
	for (Location location : locations){
%>
						<option value="<%=location.getNo() %>"<%=location.getNo() == locationNo ? "selected" : ""%> ><%=location.getName() %></option>
<%
	}
%>
					</select>
				</div>
				
				<div class="form-group mb-2" style="float: left; width: 33%; padding:10px;">
					<label class="form-label">극장</label>
					<select class="form-select" name="theaterNo" id="theaterNo" >
						<option value="" selected disabled>극장 선택</option>

					</select><br>
				</div>
			
				
				<div class="form-group mb-2">
					<label class="form-label">내용</label>
					<textarea rows="10" class="form-control" name="content" ><%=theaterBoard.getContent() %></textarea>
				</div>


		
				<div class="text-end">
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
					<button type="submit" class="btn btn-primary btn-sm">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
function refreshTh() {
	// select 박스에서 선택된 값 조회하기
	let locationNo = document.getElementById("locationNo").value;
	
	// ajax 통신하기
	// 1. XMLHttpRequest 객체 생성하기
	let xhr = new XMLHttpRequest();
	
	// 2. XMLHttpRequest 객체에서 onreadystatechange 이벤트가 발생할 때 마다 실행할 함수 저장
	xhr.onreadystatechange = function() {  // 4번 울리는 진동벨이다

		if (xhr.readyState === 4) {  // 진동벨이 4일때만 받으러간다.				
			// 1. 응답 데이터 조회하기
			let data =  xhr.responseText; 
			// 2. 응답데이터(텍스트)를 객체(자바스크립트 객체 호은 배열객체)로 변환하기
			let arr = JSON.parse(data);	
			// 3. 응답데이터로 html컨텐츠 생성하기s
			let htmlContent = "<option value='' selected disabled>--선택하세요--</option>";
			arr.forEach(function(item, index) {
				// item -> {id:100, name:"기술부"};
				let theaterNo = item.no;
				let theaterName = item.name;
				
				htmlContent += `<option value="\${theaterNo}"> \${theaterName}</option>`;
			});
			// 4. 화면에 html 컨텐츠 반영시키기
			document.getElementById("theaterNo").innerHTML = htmlContent;
		}
	}
	// 2. XMLHttpRequest 객체 초기화하기(요청방식, 요청URL 지정)
	xhr.open("GET", "location.jsp?no=" + locationNo);
	// 3. 서버로 요청 보내기
	xhr.send(null);
}
</script>
</body>
</html>