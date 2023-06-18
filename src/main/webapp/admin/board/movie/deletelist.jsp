<%@page import="dao.ReportDao"%>
<%@page import="vo.MovieBoard"%>
<%@page import="dao.MovieBoardDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<%

	// 세션에서 로그인된 사용자 정보 조회하기
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	
	// 에러메세지 출력
	if(loginId == null){
		response.sendRedirect("../../../member/login/form.jsp?err=req&job=" + URLEncoder.encode("게시판 관리", "utf-8"));
		return;
	}
	
	if (!"ADMIN".equals(loginType)) {
		response.sendRedirect("../../../board/movie/list.jsp?err=type");
		return;
	}
	
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	String opt = StringUtils.nullToBlank(request.getParameter("opt"));
	String keyword = StringUtils.nullToBlank(request.getParameter("keyword"));

	// totalrows (de, re ='N')
	MovieBoardDao movieBoardDao = MovieBoardDao.getInstance();
	
	int totalRows = 0;
	List<MovieBoard> movieBoards = null;
	Pagination pagination = null;
	if (opt.isBlank() || keyword.isBlank()) {
		totalRows = movieBoardDao.getDelTotalRows();
		pagination = new Pagination(pageNo, totalRows);

		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		movieBoards = movieBoardDao.getDelAllMovieBoards(begin, end);
	} else {	
		totalRows = movieBoardDao.getDelTotalRowsByCondition(opt, keyword);
		pagination = new Pagination(pageNo, totalRows);
		
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		movieBoards = movieBoardDao.getDelMovieBoardsByCondition(begin, end, opt, keyword);
	}
%>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/mgv.ico" type="images/x-icon">
<title>

</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

<jsp:include page="../../nav.jsp">
	<jsp:param name="menu" value="게시판"/>
</jsp:include>


<div class="container mt-3">
	<div class="row">
		<div class="col-3">
			<div class="card">
       	  		<div class="card-header text-center" ><strong>게시판관리</strong></div>
            		<div class="list-group">
    				  <a href="../home.jsp" class="list-group-item list-group-item-action">게시판 홈</a>
					  <div class="accordion" id="accordionExample">
					  <div class="accordion-item">
				    		<h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
				        영화 게시판 관리
				      </button>
				    	</h2>
				      <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div>
				        <a href="list.jsp" class="list-group-item list-group-item-action ">일반 게시판 관리</a>
				        <a href="reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a> 
				        <a href="deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a>
				      </div>
				      </div>
					 </div> 
					 
					  <div class="accordion-item">
				    	<h2 class="accordion-header" id="headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
					        스토어 게시판 관리
					      </button>
				  	   </h2>
				   	  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				       <div >
				        <a href="../store/list.jsp" class="list-group-item list-group-item-action">일반 게시판 관리</a>
				        <a href="../store/reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a> 
				        <a href="../store/deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a> 
				      </div>
				     </div>
				    </div>
					 
					 <div class="accordion-item">
				    	<h2 class="accordion-header" id="headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					        극장 게시판 관리
					      </button>
				        </h2>
				     <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				      <div >
				       	<a href="../theater/list.jsp" class="list-group-item list-group-item-action">일반 게시판 관리</a> 
				        <a href	="../theater/reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a>
				        <a href="../theater/deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a>
				       	
				      </div>
				     </div>
				    </div>
					 
					  </div>
					</div>
				</div>
		</div>	
    	<div class="col-9">
			<h1 class="border bg-light fs-4 p-2">삭제된 영화 게시물</h1>
		<div>
			<p>게시글 목록을 확인하세요.</p>
			<div>	
		
<%-- 게시판의 게시글 수 --%>			
		<div class="board-list-util">
			<p class="result-count"><strong>전체 <span id="total-rows" class="font-gblue"><%=totalRows %></span>건</strong></p>
		</div>

				
<%-- 검색 --%>			
		<div class="col-6 text-end" >	
			<form id="form-search" method="get" action="deletelist.jsp"  style="float: left;" onsubmit="searchMovieBoard(event);" class="row row-cols-lg-auto g-3 align-items-center justify-content-end">
				<input type="hidden" name="page" value="<%=pageNo %>" >
				<div class="col-12" >
					<select class="form-select form-control-sm" name="opt" >
						<option value="" <%="".equals(opt) ? "selected" : "" %>> 검색옵션</option>
						<option value="Mtitle" <%="Mtitle".equals(opt) ? "selected" : "" %>> 영화제목</option>
						<option value="name" <%="name".equals(opt) ? "selected" : "" %>> 글제목</option>
						<option value="writer" <%="writer".equals(opt) ? "selected" : "" %>> 작성자</option>
					</select>
				</div>
				<div class="col-12">
					<input type="text" class="form-control form-control-sm" name="keyword" value="<%=keyword %>" />
				</div>
				<div class="col-12">
					<button type="submit" class="btn btn-outline-dark btn-sm">검색</button>
 				</div>
			</form>
		</div>


				
	
<%-- 테이블 --%>			
<table class="table table-sm" id="table-MBoard">
				<colgroup>
					<col width="5%">
					<col width="55%">
					<col width="15%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>

<%
	if(movieBoards.isEmpty()){
%>
					<tr>
						<td colspan="5" class="text-center">검색 결과가 없습니다.</td>
					</tr>
<%
	} else {
	for(MovieBoard board : movieBoards) {
%>
					<tr>
						<td><%=board.getNo() %></td>
						<td><a class="text-black text-decoration-none" href="detail.jsp?no=<%=board.getNo() %>&page=<%=pageNo %>&opt=<%=opt %>&keyword=<%=keyword %>"><%=board.getName() %></a></td>
						<td><%=board.getMember().getId()%></td>
						<td><%=board.getReadCnt() %></td>
						<td><%=board.getCreateDate() %></td>
					</tr>
<%
		}
	}
%>
 					
			
				</tbody>
			</table>
			
<%
	if (!movieBoards.isEmpty()){
%>		
	<div class="row mb-3">
		<div class="col-12">
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a class="page-link <%=pageNo <= 1 ? "disabled" : "" %>" 
							href="deletelist.jsp?page=<%=pageNo - 1 %>"
							onclick="goPage(event, <%=pageNo - 1 %>)"
							>이전</a>
					</li>
<%
		for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>
					<li class="page-item">
						<a class="page-link <%=pageNo == num ? "active" : "" %>" 
							href="deletelist.jsp?page=<%=num %> "
							onclick="goPage(event, <%=num %>)"><%=num %></a>
					</li>
<%
		}
%>
					<li class="page-item">
						<a class="page-link <%=pageNo >= pagination.getTotalPages() ? "disabled" : "" %>" 
							href="deletelist.jsp?page=<%=pageNo + 1 %>"
							onclick="goPage(event, <%=pageNo + 1 %>)"
							>다음</a>
					</li>
				</ul>
			</nav>
			
			
<%
	}
%>

				 </div>
			 </div>
		</div>
	</div>
</div>
</div>
</div>

<script type="text/javascript">

	function searchMovieBoard(e){
		let opt = document.querySelector("select[name=opt]").value;
		let keyword = document.querySelector("input[name=keyword]").value;
		
		if (opt == ""){
			alert("검색옵션을 선택하세요");
			e.preventDefault();
			return;
		}
		
		if (keyword == "") {
			alert("검색 키워드를 선택하세요");
			e.preventDefault();
			return;
		}
		
		document.querySelector("input[name=page]").value = 1;
	}
	
	
	function goPage(e, pageNo) {
		event.preventDefault();
		document.querySelector("input[name=page]").value = pageNo;
		document.getElementById("form-search").submit();
	}

</script>
</body>
</html>
</html>