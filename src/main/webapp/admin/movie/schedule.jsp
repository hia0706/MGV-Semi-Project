<%@page import="dao.ScheduleDao"%>
<%@page import="java.util.HashSet"%>
<%@page import="vo.Schedule"%>
<%@page import="java.util.List"%>
<%@page import="vo.Theater"%>
<%@page import="vo.Location"%>
<%@page import="dao.TheaterDao"%>
<%@page import="dao.LocationDao"%>
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
	response.sendRedirect("/mgv/member/login/form.jsp");
	return;
}
%>

<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>영화 스케줄 &#60; 영화 관리</title>
<style type="text/css">
.layer {
    display: block;
    float: left;
    width: 360px;
    height: 59px;
    border: 0;
    font-size: 1.2em;
    color: #fff;
    background-color: transparent;
}
.keyword {
    display: inline-block;
    width: 100%;
    height: 32px;
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    border: 1px solid #d8d9db;
    vertical-align: middle;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}

input {
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-variant-alternates: ;
    font-weight: ;
    font-stretch: ;
    font-size: ;
    font-family: ;
    font-optical-sizing: ;
    font-kerning: ;
    font-feature-settings: ;
    font-variation-settings: ;
    text-rendering: auto;
    color: fieldtext;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    -webkit-rtl-ordering: logical;
    cursor: text;
    background-color: field;
    margin: 0em;
    padding: 1px 2px;
    border-width: 2px;
    border-style: inset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
}
body {
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
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

.keywords li:hover, .keywords .selected {
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
.layer-header-search .wrap .header-search-area {
    overflow: hidden;
    position: absolute;
    left: 560px;
    top: 170px;
    width: 420px;
    height: 60px;
    border-bottom: 1px solid #fff;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	<c:set var="theaters" value="${theaterDao.getAllTheaters()}" />
	<c:set var="locationDao" value="${LocationDao.getInstance()}" />
	<c:set var="locations" value="${locationDao.getLocations()}" />
<body>

	<div class="container">

		<header>
		<div class="header-search-area">
            </div>
		
			<label for="movieTitle">영화검색 </label> <input class="keyword"
				id="movieTitle" name="searchWord" value="${param.title}" placeholder="영화제목을 검색하세요">
		</header>

		<div class="keywords" id="keywords"></div>
		<div class="detail" style="display: none">
			<img src="">
		</div>

		<label for="datepicker">날짜 선택 : </label> <input type="text"
			class="datepicker" id="datepicker">




		<div class="row mb-3">


			<div class="col-12">
				<table class="table">
					<thead>
						<tr class="table">
							<th style="width:15%;">지역</th>
							<th>1타임</th>
							<th>2타임</th>
							<th>3타임</th>
							<th>4타임</th>
						</tr>
					</thead>
				</table>

				<form id="frm" onchange="activateBtns()">
					<c:forEach var="location" items="${locations}">
						<table class="table" id="location+${location.no}">
							<tr class="table-dark" style="width:5%;">
								<th style="width:12%;">${location.name}</th>
							<tr>
								<c:set var="locNo" value="${location.no}" />
								<c:set var="theaters"
									value="${theaterDao.getTheatersByLocNo(locNo)}" />
								<c:forEach var="theater" items="${theaters}">
									<tr class="scheduleList" id="theater+${theater.no}">
										<td style="width:15%;"><b>${theater.name}</b></td>
										<td class="scheduleBtn"><input type="button"
											class="btn btn-danger" name="sc" value="해제" id="a${theater.no}1" /></input></td>
										<td class="scheduleBtn"><input type="button"
											class="btn btn-danger" name="sc" value="해제" id="a${theater.no}2" /></input></td>
										<td class="scheduleBtn"><input type="button"
											class="btn btn-danger"  name="sc" value="해제" id="a${theater.no}3" /></input></td>
										<td class="scheduleBtn"><input type="button"
											class="btn btn-danger" name="sc" value="해제" id="a${theater.no}4" /></input></td>
									</tr>
								</c:forEach>
							</tr>
						</table>
					</c:forEach>
				</form>
			</div>
		</div>
		<button class="btn btn-primary disabled" id="submit">등록</button>
		<button class="btn btn-secondary disabled" id="cancel">취소</button>
	</div>
	<script>
let keyword = document.querySelector(".keyword")
let keywords = document.querySelector(".keywords")
let scheduleBtns= document.querySelectorAll(".btn")


let submit=document.querySelector("#submit")
let cancel=document.querySelector("#cancel")
let selectedDay= document.querySelector("#datepicker").value
let movieNo
let scheduleData

cancel.addEventListener("click", e => {
	getScheduleDate()
	      	submit.classList.remove("active")
                	submit.classList.add("disabled")
                	cancel.classList.remove("active")
                	cancel.classList.add("disabled")
})



submit.addEventListener("click", e => {
	
	selectedDay= document.querySelector("#datepicker").value
	if(!selectedDay){
		alert("날짜를 선택하세요")
		return;
	}
	if(!movieNo){
		alert("영화를 선택하세요")
		return;
	}
	var sdata=[];
	const scheduleList1=document.querySelectorAll(".scheduleBtn")
	for (let s of scheduleList1){
		const sc= s.querySelector("input")
		if (sc.value==="등록"){
			sdata.push(sc.id)
		}
	}

    let url = "ScheduleUpdate.jsp"
            $.ajax({
                url: url, 
                data: {q:sdata, mNo:movieNo, date:selectedDay }, 
                method: "GET",   
                dataType: "TEXT",
                success: function(response){
                	submit.classList.remove("active")
                	submit.classList.add("disabled")
                	cancel.classList.remove("active")
                	cancel.classList.add("disabled")
                	alert("스케쥴적용완료")
                }
            })
    	
})



function getScheduleDate(){
	isMovie()
	if(!movieNo || movieNo==""){
		alert("영화를 먼저 선택하세요")
		return
	}
	selectedDay= document.querySelector("#datepicker").value
	if(!selectedDay){
		alert("날짜도 선택하세요")
		return
	}
    let url = "scheduleAjax.jsp"
        $.ajax({
            url: url, 
            data: { qNo: movieNo, qDate:selectedDay }, 
            method: "GET",   
            dataType: "json"
        })
        .done(function(json) {
        	let schedules =json
        if (json!==null){
			listSchedules(schedules)
        }
            else alert("스케쥴에러");
    })
	
	
}

function listSchedules(schedules){
	const scheduleList=document.querySelectorAll(".scheduleBtn")
	for (let s of scheduleList){
	disableBtn(s.querySelector("input"))
	}
	for (let tmp of schedules){
		const id="#a"+tmp
		enableBtn(id)
	}
	
}


function disableBtn(btn){
	if (btn.value==="등록"){
	btn.value="해제"
	btn.classList.remove("btn-success")
	btn.classList.add("btn-danger")
	}
}
function enableBtn(id){
	let btn=document.querySelector(id)
	if (btn.value==="해제"){
	btn.value="등록"
	btn.classList.remove("btn-danger")
	btn.classList.add("btn-success")
	}
}


scheduleBtns.forEach ( (btn) => {
	btn.addEventListener("click", e => {
		
		isMovie()
		if(!movieNo  || movieNo===0){
			alert("영화를 선택하세요")
			return
		}
		selectedDay= document.querySelector("#datepicker").value
		if(!selectedDay){
			alert("날짜도 선택하세요")
			return
		}
		
	if (e.target.value==="해제"){
		e.target.value="등록"
		e.target.classList.remove("btn-danger")
		e.target.classList.add("btn-success")
		
		
	}else if (e.target.value==="등록"){
		e.target.value="해제"	
		e.target.classList.remove("btn-success")
		e.target.classList.add("btn-danger")

	}
	if (submit.classList.contains("disabled")){
		submit.classList.remove("disabled")
		submit.classList.add("active")
		}
		
		if (cancel.classList.contains("disabled")){
		cancel.classList.remove("disabled")
		cancel.classList.add("active")
			}
	})
})



function closeKeywords() {
    keywords.style.display = "none"
    keywords.innerHTML = ""
}


$("#movieTitle").on("keyup", function() {
	const movieTitle=document.querySelector("#movieTitle")
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
    const detail = document.querySelector(".detail")
  	const poster=detail.querySelector("img")
  	poster.src=""
 
});
    
keywords.addEventListener("click", e => {
    keyword.value = e.target.textContent
    keywords.innerHTML = ""
})
function get_list(keyword){
    let url = "trie.jsp"
    $.ajax({
        url: url,
        data: { searchWord: keyword }, 
        method: "GET",  
        dataType: "json" 
    })
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

function isMovie(){
	const mt=document.querySelector("#movieTitle")
	   title=mt.value;
    let url = "movieDetailAjax.jsp"
        $.ajax({
            url: url, 
            data: { q: title }, 
            method: "GET",   
            dataType: "json"
        })
        .done(function(json) {
    		movieNo=json.no
    })}
    
    
function isMovieValid(title){
    let url = "movieDetailAjax.jsp"
    $.ajax({
        url: url, 
        data: { q: title }, 
        method: "GET",   
        dataType: "json"
    })
    .done(function(json) {
        if(json!== null){
      	const detail = document.querySelector(".detail")
      	const poster=detail.querySelector("img")
      	poster.src=json.posterURL
		movieNo=json.no
      	detail.style.display ="block"
      		getScheduleDate()
    }
        else alert("영화를 선택하세요");
})}

$('.datepicker').datepicker({
    onSelect: function(dateString) {
	const movieTitle=document.querySelector("#movieTitle")
   title=movieTitle.value;
   isMovieValid(title);
}});

</script>

</body>
</html>
