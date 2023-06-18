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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="megabox.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/timetable.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
.btn.btn-xs { -
	-bs-btn-padding-y: .25rem; -
	-bs-btn-padding-x: .5rem; -
	-bs-btn-font-size: .75rem;
}
</style>
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

	<div class="container">
		<div class="row mb-3">
			<div class="col-12">
				<h1 class="border bg-light fs-4 p-2">${movie.title}상영할 극장 목록</h1>
			</div>
		</div>
		<div class="time-schedule mb30">
			<div class="wrap">
				<button type="button" title="이전 날짜 보기" class="btn-pre"
					disabled="true">
					<i class="iconset ico-cld-pre"></i> <em>이전</em>
				</button>
				<div class="date-list">
					<div class="year-area">
						<div class="year" style="left: 30px; z-index: 1; opacity: 1;">2023.06</div>
						<div class="year" style="left: 450px; z-index: 1; opacity: 0;"></div>
					</div>
					<div class="date-area">
						<div class="wrap"
							style="position: relative; width: 2100px; border: none; left: -70px;">
							<button class="disabled" type="button" date-data="2023.06.13"
								month="5" tabindex="-1">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">13<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">화</span><span
									class="day-en" style="pointer-events: none; display: none">Tue</span>
							</button>
							<button class="" type="button" date-data="2023.06.14" month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">14<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">오늘</span><span
									class="day-en" style="pointer-events: none; display: none">Wed</span>
							</button>
							<button class="" type="button" date-data="2023.06.15" month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">15<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">내일</span><span
									class="day-en" style="pointer-events: none; display: none">Thu</span>
							</button>
							<button class="" type="button" date-data="2023.06.16" month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">16<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">금</span><span
									class="day-en" style="pointer-events: none; display: none">Fri</span>
							</button>
							<button class="sat" type="button" date-data="2023.06.17"
								month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">17<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">토</span><span
									class="day-en" style="pointer-events: none; display: none">Sat</span>
							</button>
							<button class="holi" type="button" date-data="2023.06.18"
								month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">18<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">일</span><span
									class="day-en" style="pointer-events: none; display: none">Sun</span>
							</button>
							<button class="" type="button" date-data="2023.06.19" month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">19<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">월</span><span
									class="day-en" style="pointer-events: none; display: none">Mon</span>
							</button>
							<button class="" type="button" date-data="2023.06.20" month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">20<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">화</span><span
									class="day-en" style="pointer-events: none; display: none">Tue</span>
							</button>
							<button class="on" type="button" date-data="2023.06.21" month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">21<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">수</span><span
									class="day-en" style="pointer-events: none; display: none">Wed</span>
							</button>
							<button class="" type="button" date-data="2023.06.22" month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">22<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">목</span><span
									class="day-en" style="pointer-events: none; display: none">Thu</span>
							</button>
							<button class="disabled" type="button" date-data="2023.06.23"
								month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">23<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">금</span><span
									class="day-en" style="pointer-events: none; display: none">Fri</span>
							</button>
							<button class="disabled sat" type="button" date-data="2023.06.24"
								month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">24<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">토</span><span
									class="day-en" style="pointer-events: none; display: none">Sat</span>
							</button>
							<button class="disabled holi" type="button"
								date-data="2023.06.25" month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">25<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">일</span><span
									class="day-en" style="pointer-events: none; display: none">Sun</span>
							</button>
							<button class="disabled" type="button" date-data="2023.06.26"
								month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">26<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">월</span><span
									class="day-en" style="pointer-events: none; display: none">Mon</span>
							</button>
							<button class="disabled" type="button" date-data="2023.06.27"
								month="5">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">27<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">화</span><span
									class="day-en" style="pointer-events: none; display: none">Tue</span>
							</button>
							<button class="disabled" type="button" date-data="2023.06.28"
								month="5" tabindex="-1">
								<span class="ir">2023년 6월</span><em
									style="pointer-events: none;">28<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">수</span><span
									class="day-en" style="pointer-events: none; display: none">Wed</span>
							</button>
						</div>
					</div>
				</div>
				<button type="button" title="다음 날짜 보기" class="btn-next"
					disabled="true">
					<i class="iconset ico-cld-next"></i> <em>다음</em>
				</button>
				<div class="bg-line">
					<input type="hidden" name="datePicker" id="dp1686731025694"
						class="hasDatepicker" value="2023.06.21">
					<button type="button" class="btn-calendar-large" title="달력보기">
						달력보기</button>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-12">
				<p>전체 극장을 확인하세요.</p>
				<table class="table">
					<thead>
						<tr class="table-dark">
							<th style="width: 10%;">극장명</th>
							<th style="width: 45%;">지역</th>
							<th style="width: 10%;">날짜선택</th>
							<th style="width: 10%;">스케쥴 등록/해제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="theater" items="${theaters}">
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
</body>
</html>
