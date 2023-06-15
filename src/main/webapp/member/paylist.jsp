<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>구매내역 &#60; 회원서비스 | 영화 그 이상의 감동. MGV</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	#box-2 th {
		width: 10%;
	}
	
	#box-2 td {
		width: 10%;
	}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp">
		<jsp:param name="menu" value="MEMBER" />
	</jsp:include>
	<div class="container">
		<div class="row mb-3">
			<div class="col-12">
				<h1 class="border bg-light fs-4 p-2">구매 내역</h1>
			</div>
		</div>
		<table class="table-wrap">
			<colgroup>
				<col style="width: 80px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">구분</th>
					<td>
						<input class="form-check form-check-inline " type="radio" name="all" id="radPurc01" value="A" checked="checked">
						<label for="radPurc01">전체</label>
						<input class="form-check form-check-inline " type="radio" name="buy" id="radPurc02" value="B">
						<label for="radPurc02">구매내역</label>
						<input class="form-check form-check-inline " type="radio" name="cancel" id="radPurc03" value="C">
						<label for="radPurc03">취소내역</label>
					</td>
				</tr>
				<tr>
					<th scope="row">조회기간</th>
					<td>
						<div class="btn-period">
							<button type="button" class="btn" value="D7">1주일</button>
							<button type="button" class="btn" value="M1">1개월</button>
							<button type="button" class="btn" value="M3">3개월</button>
							<button type="button" class="btn on" value="M6">6개월</button>
						</div>
						<div class="date">
							<input type="text" title="조회기간 시작 날짜 입력" placeholder="yyyy.mm.dd" class="date-calendar v2 hasDatepicker" id="dp1686726042560">
							<button type="button" class="ui-datepicker-trigger">날짜선택</button>
							<span>~</span>
							<input type="text" title="조회기간 마지막 날짜 입력" placeholder="yyyy.mm.dd" class="date-calendar v2 hasDatepicker" id="dp1686726042561">
							<button type="button" class="ui-datepicker-trigger">날짜
								선택</button>
							<button type="button" class="button gray-line" name="search">
								<i class="iconset ico-search-gray"></i> 조회
							</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container" id="box-2">
		<div class="row mb-3">
			<div class="col-12">
				<table class="table table-hover" id="result">
					<tbody>
						<tr class="table bg-light">
							<th>결제일</th>
							<th>상품번호</th>
							<th>상품명</th>
							<th>결제금액</th>
							<th>상태</th>
						</tr>
						<tr>
							<td>2022-10-30</td>
							<td>1</td>
							<td>패키지</td>
							<td>12000</td>
							<td>구매취소</td>
						</tr>
						<tr>
							<td>2022-12-12</td>
							<td>2</td>
							<td>콤보</td>
							<td>14000</td>
							<td>구매취소</td>
						</tr>
						<tr>
							<td>2023-01-20</td>
							<td>3</td>
							<td>윙세트+팝콘+콜라</td>
							<td>24000</td>
							<td>구매완료</td>
						</tr>
						<tr>
							<td>2023-03-23</td>
							<td>4</td>
							<td>팝콘+콜라</td>
							<td>8000</td>
							<td>구매완료</td>
						</tr>
						<tr>
							<td>2023-05-23</td>
							<td>4</td>
							<td>후라이드치킨</td>
							<td>18000</td>
							<td>구매취소</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>