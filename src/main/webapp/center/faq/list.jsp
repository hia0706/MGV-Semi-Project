<%@page import="vo.FaqCategory"%>
<%@page import="dao.FaqCategoryDao"%>
<%@page import="vo.Faq"%>
<%@page import="dao.FaqDao"%>
<%@page import="util.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	
	//세션에서 로그인된 사용자 아이디 조회
	String id = (String) session.getAttribute("loginId");
	
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	FaqCategoryDao faqCategoryDao = FaqCategoryDao.getInstance();
	List<FaqCategory> categoryList = faqCategoryDao.getAllFaqCategories();
	
	FaqDao faqDao = FaqDao.getInstance();
	int totalRows = faqDao.getTotalRows();
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	
	
	List<Faq> faqList = faqDao.getFaq(pagination.getBegin(), pagination.getEnd());

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
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .40rem; --bs-btn-padding-x: .7rem; --bs-btn-font-size: .95rem;}
	
	table {
	   text-align: center;
	}
	
</style>
</head>
<body>


<jsp:include page="../../common/nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>


<div class="container mt-3">
	<div class="row">
		<div class="col-3">
    				<div class="card">
       	  		<div class="card-header text-center" >고객센터</div>
            		<div class="list-group">
  <a href="../home.jsp" class="list-group-item list-group-item-action">고객센터 홈</a>
  <a href="../lostitem/list.jsp" class="list-group-item list-group-item-action">분실물 문의</a>
  <a href="../oneonone/insertform.jsp" class="list-group-item list-group-item-action">1:1 문의</a>
  <a href="list.jsp" class="list-group-item list-group-item-action">자주 묻는 질문</a>
  <a href="../notice/list.jsp" class="list-group-item list-group-item-action">공지사항</a>
  <a class="list-group-item list-group-item-action disabled" style="color:gray; font-size:15px;">
  		MGV 고객센터 <br> Dream center <br><br> 10:00~19:00
  </a>
					</div>
				</div>
    	</div>
    	<div class="col-9">
        	<h1 class="fs-2 p-2">자주 묻는 질문</h1>
			<div>
			
<%-- faq 글 수 --%>	
				<div class="board-list-util">
					<p class="result-count"><strong>전체 <span id="total-rows" class="font-gblue"><%=totalRows %></span>건</strong></p>
				</div>
	
<%-- 카테고리를 선택하는 select --%>
				<select id="category" title="카테고리 선택" class="form-select selectpicker form-control mb-3" style="width: 150px;" name="categoryNo" onchange="refreshFaq();">
					<option value="" selected disabled >카테고리 선택</option>
					
<% for(FaqCategory category : categoryList) { %>
				<option value="<%=category.getNo() %>"><%=category.getName() %></option>
<% } %>
				
				</select>					
			
			<table class="table border-top"  id="table_Faq">
				<thead>
					<tr class="table-light" > 
						<th style="width: 5%;">번호</th>
						<th style="width: 10%;">카테고리</th>
						<th style="width: 50%;">제목</th>
						<th style="width: 10%;">등록일</th>
					</tr>
				</thead>
				<tbody>
	
<% for (Faq faq : faqList) { %>				
				
					<tr>
						<td><%=faq.getNo() %></td>
						<td><%=faq.getFaqCategory().getName() %></td>
						<td style="text-align:left">
							<a href="detail.jsp?no=<%=faq.getNo() %>" class="text-black text-decoration-none">
								<%=faq.getTitle() %>
							</a>
						</td>
						<td><%=faq.getCreateDate() %></td>
					</tr>
					
<% } %>				
						
					
				</tbody>
			</table>
			
			
<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : "" %>">
						<a href="list.jsp?page=<%=pageNo - 1 %>" class="page-link">이전</a>
					</li>
					
	<% for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) { %>					
					
					<li class="page-item <%=pageNo == num ? "active" : "" %>">
						<a href="list.jsp?page=<%=num  %>" class="page-link"><%=num %></a>
					</li>
					
	<% } %>					
					
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : "" %>">
						<a href="list.jsp?page=<%=pageNo + 1 %>" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function goPage(e, pageNo) {
		e.preventDefault();
		refreshFaq(pageNo)
	}

	function refreshFaq(pageNo) {
		pageNo = pageNo || 1;
		// select 박스에서 선택된 값 조회하기
		let categoryNo = document.getElementById("category").value;
		
		// ajax 요청
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4) {
				let text = xhr.responseText;
				let obj = JSON.parse(text);
				
				document.getElementById("total-rows").textContent = obj.totalRows;
				let faqs = obj.faqList;
				let pagination = obj.pagination;
				
				let htmlContents = ``;
				faqs.forEach(function(item, index) {
					htmlContents += `
						<tr>
							<td>\${item.no}</td>
							<td>\${item.faqCategory.name}</td>
							<td style="text-align:left"><a class="text-black text-decoration-none" href="detail.jsp?no=\${item.no}">\${item.title}</a></td>
							<td>\${item.createDate}</td>
						</tr>
					`;
				});
				
				document.querySelector("#table_Faq tbody").innerHTML = htmlContents;
				
				
				   if(pagination.totalRows > 0){
		                let paginationHtmlContent = `<nav>   
		                   <ul class="pagination justify-content-center">
		                   <li class="page-item \${pagination.page <= 1 ?  'disabled' : ''}">
		                      <a href="list.jsp?page=\${pagination.pageNo -1}" onclick="goPage(event, \${pagination.page -1})" class="page-link">이전</a>
		                   </li>`;
		             
		                for (let num = pagination.beginPage; num <= pagination.endPage; num++) {
		                   
		                   paginationHtmlContent += `<li class="page-item \${pagination.page == num ? 'active' : ''}">
		                      <a href="list.jsp?page=\${num}" onclick="goPage(event, \${num})" class="page-link">\${num}</a>
		                        </li>`;

		                }
		                
		                paginationHtmlContent += `<li class="page-item \${pagination.page >= pagination.totalPages ? 'disabled' : ''}">
		                   <a href="list.jsp?page=\${pagination.page + 1}" onclick="goPage(event, \${pagination.page + 1})" class="page-link">다음</a>
		                     </li>
		                   </ul>
		                </nav>`
					
					document.querySelector(".pagination").innerHTML = paginationHtmlContent;
				} else {
					document.querySelector("#table_Faq tbody").innerHTML = `
						<tr>
							<td colspan="4" class="text-center">조회결과가 존재하지 않습니다.</td>
						</tr>
					`;
					document.querySelector(".pagination").innerHTML = "";
				}
			}
		};
		xhr.open("GET", "faq.jsp?no=" + categoryNo + "&page=" + pageNo);
		xhr.send(null);
	}

</script>
</body>
</html>
	
</body>
</html>