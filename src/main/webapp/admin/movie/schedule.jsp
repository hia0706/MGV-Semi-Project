<%@page import="java.util.List"%>
<%@page import="vo.Theater"%>
<%@page import="dao.TheaterDao"%>
<%@page import="dao.ManagerMovieDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="ko">


<%
//세션에서 로그인타입 속성획득
String loginType = (String) session.getAttribute("loginType");

//로그인타입 관리자아니면 로그인으로 리다이렉트시킴
if (!"ADMIN".equals(loginType)) {
	response.sendRedirect("../member/login/login.jsp");
	return;
}
%>

<head>
<title></title>
<style type="text/css">
        header {
            display: flex;
            width: 600px;
            flex-direction: column;
            justify-content: center;
        }
        .keywords {
            z-index: 1;
            background-color: white;
            display: none;
            top: 110px;
            width: 600px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .keywords li:hover,
        .keywords .selected {
            cursor: pointer;
            background-color: lightskyblue;
            color: white;
        }
        .keywords .active {
            background-color: lightskyblue;
            color: white;
        }
        .keywords ul {
            padding: 0;
            margin: 0;
        }
        .keywords li {
            list-style: none;
            padding-left: 10px;
        }
        
        table {
            margin-top: 10px;
        }

</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
 	<link rel="stylesheet" href="/resources/demos/style.css">
 
 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
  <script>
  $.datepicker.setDefaults({
      dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
      prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
      nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
      closeText: '닫기', // 닫기 버튼 텍스트 변경
      currentText: '오늘', // 오늘 텍스트 변경
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
      dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
      showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
      yearSuffix: '년',	//
      changeYear : true , changeMonth : true,
      showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
//      buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
//      buttonImage: "images/calendar.gif",	// 조그만한 아이콘 이미지
//      buttonText: "Select date"	// 조그만한 아이콘 툴팁
  });
  
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  
  
  $(document).ready(function (){     
  });
  </script>
</head>


<body>

	<jsp:include page="../../admin/nav.jsp">
		<jsp:param value="menu" name="영화" />
	</jsp:include>
	<c:set var="no" value="${param.no}" />
	<c:set var="managerMovieDao" value="${ManagerMovieDao.getInstance()}" />
	<c:set var="movie" value="${managerMovieDao.getMovieByNo(no)}" />
	<c:set var="theaterDao" value="${TheaterDao.getInstance()}" />
	<c:set var="theaters"
		value="${theaterDao.getAllTheatersWithLocationName()}" />
	<c:set var="locationDao" value="${LocationDao.getInstance()}" />
	 
	 
<body>
	
	<div class="container">

 <header>
     <label for="movieTitle">영화명 입력: </label>
  <input class="keyword" id="movieTitle" name="searchWord" autocomplete="off">
    </header>
 
<div class="keywords" id="keywords">
</div>

<label for="datepicker">날짜 선택 : </label>
 			<input type="text" class="datepicker"> 

		
		<div class="row mb-3">
			<div class="col-12">
				<table class="table">
					<thead>
						<tr class="table-dark">
							<th style="width: 10%;">극장명</th>
							<th style="width: 10%;">지역</th>
							<th style="width: 50%;">스케쥴선택</th>
							<th style="width: 10%;">스케쥴 등록/해제</th>
						</tr>
					</thead>
					<tbody class ="theaters">
						<c:forEach  var="theater" items="${theaters}" >
							<tr class="align-middle">
								<td><a href="" class="text-black text-decoration-none">${theater.name}</a></td>
								<td>${theater.location.name}</td>
								<td>${movie.getStringFormattedDate()}</td>
								<td><a href="schedule.jsp?no=${movie.no}" class="btn">등록</a></td>
							</tr>
						</c:forEach>


					</tbody>
				</table>

			</div>
		</div>
</div>
<script>
let keyword = document.querySelector(".keyword")
let keywords = document.querySelector(".keywords")
function closeKeywords() {
    keywords.style.display = "none"
    keywords.innerHTML = ""
}


$("#movieTitle").on("keyup", function() {
    const text = movieTitle.value;
    const selectedKeyword = keywords.querySelector("li.selected")
    
    if(event.keyCode == '27') {
        closeKeywords()
        return;
    }else if (event.key !== "ArrowUp" && event.key !== "ArrowDown"&&!selectedKeyword){
   get_list(text)
    }
    if (event.key === "Enter"){
    	keyword.value = selectedKeyword.textContent
    	 keywords.innerHTML = ""
    }
    
    const keywordsList = keywords.querySelectorAll("li")
    if((event.key === "ArrowUp" || event.key === "ArrowDown") && keywords.style.display === "block") {
        let target
        const initIndex = event.key === "ArrowUp" ? keywordsList.length - 1 : 0
        const adjacentSibling = selectedKeyword && (event.key === "ArrowUp" ? selectedKeyword.previousElementSibling : selectedKeyword.nextElementSibling)
        
        if(adjacentSibling) {
            target = adjacentSibling
        } else {
            target = keywordsList.item(initIndex)
        } 
        selectedKeyword && selectedKeyword.classList.remove("selected")
        target.classList.add("selected")
        keyword.value = target.textContent
    }
    if(keyword.value.length === 0) {
        keywords.innerHTML = ""
    }
});
    
keywords.addEventListener("click", e => {
    // 요구사항 4 - 마우스로 추천 검색어를 누르면 커서가 위치한 검색어가 입력창에 반영되어야 합니다.
    keyword.value = e.target.textContent
    keywords.innerHTML = ""
})
function get_list(keyword){
    let url = "trie.jsp"
    $.ajax({
        url: url, // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
        data: { searchWord: keyword },  // HTTP 요청과 함께 서버로 보낼 데이터
        method: "GET",   // HTTP 요청 메소드(GET, POST 등)
        dataType: "json" // 서버에서 보내줄 데이터의 타입
    })
    // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
    .done(function(json) {
        let dataList = json
        if(dataList!== null){
        	 keywords.innerHTML = ""
        	 const $ul = document.createElement("ul")
        	
             for(let title of dataList) {
                 const $li = document.createElement("li")
                 $li.textContent = title
                 $ul.append($li)
             }
             keywords.append($ul)
             
             keywords.style.display = "block" 
       
    }
})}

$('.datepicker').datepicker({
    onSelect: function(dateString) {
        
    }
});

</script>	
	
</body>
</html>
