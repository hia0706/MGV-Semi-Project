<%@page import="dao.ReportDao"%>
<%@page import="vo.ReportReason"%>
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
//세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");
	
	// 에러메세지 출력
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(loginId);
	
	if (member == null) {
	   response.sendRedirect("../../member/loginform.jsp?err=fail");
	   return;
	}
	
	// 신고 이유 셀렉트 목록 출력
	ReportDao reportReasonDao = ReportDao.getInstance();
	List<ReportReason> reportReasons = reportReasonDao.getReportReasonrs();
	
	// 요청 파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
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

<div class="container my-3">

	<div class="row mb-3">
		<div class="col-12">
			<p style="font-size : 18px;"><strong>이 게시물을 신고하는 이유</strong></p>
			<p style="font-size : 15px;">지식재산권 침해를 신고하는 경우를 제외하고 회원님의 신고는익명으로 처리됩니다. 누군가 위급한 상황에 있다고 생각된다면 즉시 현지 응급 서비스 기관에 연락하시기 바랍니다.</p>
			
			<form class="border bg-light p-3" method="get" action="report.jsp?no=<%=boardNo %>" >
				<input type="hidden" name="no" value="<%=boardNo %>">
	
				<div class="form-group mb-2" style="width: 33%; padding:5px;">
					<label class="form-label">신고이유</label>
					<select class="form-select" name="reasonNo" id="selectbox" >
<%
	for (ReportReason reason : reportReasons){
%>
					<option value="<%=reason.getNo() %>"><%=reason.getName() %></option>
<%
	}
%>
					</select>
				</div>
				
				
				<div class="form-group mb-2">
					<label class="form-label">상세내용</label>
					<textarea rows="5" class="form-control" name="reasonContent" ></textarea>
				</div>


		
				<div class="text-end">
					<button type="reset" class="btn btn-secondary btn-sm" onclick="reset();">취소</button>
					<button type="submit" class="btn btn-primary btn-sm" onclick="submit();">신고</button>
				</div>
			</form>
			
			<script type="text/javascript"></script>
			
		</div>
	</div>
</div>
</body>
</html>