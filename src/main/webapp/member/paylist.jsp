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
		<div class="container mb-3 p-3">
			<table id="status" onchange="refreshStatus();">
				<tbody>
					<tr>
						<td>
						<label class="p-3">구분</label>
							<div class="form-check form-check-inline mb-2">
								<input class="form-check form-check-input" type="radio" name="status" id="all" value="A" checked="checked">
								<label class="form-check-label" for="all">전체</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check form-check-input " type="radio" name="status" id="buy" value="B">
								<label class="form-check-label" for="buy">구매내역</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check form-check-input " type="radio" name="status" id="cancel" value="C">
								<label class="form-check-label" for="cancel">취소내역</label>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container mb-3">
		<div class="row mb-3">
			<div class="col-12">
				<table class="table" id="table-payments">
					<thead>
						<tr>
							<th>결제일</th>
							<th>상품번호</th>
							<th>상품명</th>
							<th>결제금액</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
<script type="text/javascript">
	function refreshStatus() {
		
	}
</script>
</body>
</html>







