<%@page import="vo.StoreBoard"%>
<%@page import="vo.Product"%>
<%@page import="dao.StoreBoardDao"%>
<%@page import="vo.ProductCategory"%>
<%@page import="dao.ProductCategoryDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	// 세션에서 로그인된 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");
	
	if(loginId == null){
		response.sendRedirect("../../member/login/form.jsp?err=req&job=" + URLEncoder.encode("게시물수정", "utf-8"));
		return;
	}

	
	int boardNo = Integer.parseInt(request.getParameter("no"));
	
	// 품목 셀렉트 박스 목록
	ProductCategoryDao productCategoryDao = ProductCategoryDao.getInstance();
	List<ProductCategory> categories = productCategoryDao.getCategories();
	
	// 상품이름 셀렉트 박스 목록
	StoreBoardDao storeBoardDao = StoreBoardDao.getInstance();
	List<Product> products = storeBoardDao.getProducts();	


	// 조회된 게시물 번호로 게시물을 조회한다
	StoreBoard storeBoard = storeBoardDao.getAllStoreBoardsByNo(boardNo);
	
	// 해당 게시물의 작성자가 아닌 다른 사용자가 게시물을 수정하려 했을 때 에러메세지를 출력한다.
	if (!storeBoard.getMember().getId().equals(loginId)){
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id&job="+URLEncoder.encode("수정", "utf-8"));
	} 
	
	int catNo = storeBoard.getCategory().getNo();
	int productNo = storeBoard.getProduct().getNo();
	String grade = storeBoard.getGrade();
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
				<input type="hidden" name="no" value="<%=boardNo %>" id="boardNo">
				<div class="form-group mb-2">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="name" value="<%=storeBoard.getName() %>"/>
				</div>

				<div class="txc-textbox" style="background-color:#FAFAFA; border:#FFFFFF 4px solid; border-radius: 5px; width: 33%; padding:10px; float: left;" >
					<label class="form-label">별점은 변경하실 수 없습니다.</label>
					<p>별점 : <%=score %></p>
				</div>				
								
								
				<div class="form-group mb-2" style="float: left; width: 33%; padding:10px;">
					<label class="form-label">품목</label>
					<select class="form-select" name="catNo" id="cat" onchange="refreshProduct();">
						<option value= 0 selected disabled>품목 선택</option>
<%
	for (ProductCategory category : categories){
%>
					<option value="<%=category.getNo() %>"<%=category.getNo() == catNo ? "selected" : ""%> ><%=category.getName() %></option>
<%
	}
%>
					</select>
				</div>
				<div class="form-group mb-2" style="float: left; width: 33%; padding:10px;">
					<label class="form-label">상품</label>
					<select class="form-select" name="productNo" id="product">
<%
	for (Product product : products){
%>				
						<option value="<%=product.getNo() %>"<%=product.getNo() == productNo ? "selected" : ""%> ><%=product.getName() %></option>
<%
	}
%>
					</select><br>
				</div>
			
				
				<div class="form-group mb-2">
					<label class="form-label">내용</label>
					<textarea rows="10" class="form-control" name="content" ><%=storeBoard.getContent() %></textarea>
				</div>


		
				<div class="text-end">
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
					<button type="submit" class="btn btn-primary btn-sm" onclick="null();">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	function refreshProduct() {
		// select 박스에서 선택된 값 조회하기
		let catNo = document.getElementById("cat").value;
		let boardNo = document.getElementById("boardNo").value;
		
		// ajax 통신하기
		// 1. XMLHttpRequest 객체 생성하기
		let xhr = new XMLHttpRequest();
		// 2. XMLHttpRequest 객체에서 onreadystatechange 이벤트가 발생할 때 마다 실행할 함수 저장
		xhr.onreadystatechange = function() {  // 4번 울리는 진동벨이다
			if (xhr.readyState === 4) {  // 진동벨이 4일때만 받으러간다.				
				let text = xhr.responseText;
				let obj = JSON.parse(text);
				
				// 3. 응답데이터로 html컨텐츠 생성하기
				let products = obj.product
				let savedProduct = obj.productNo;
				let htmlContent = "<option value='' selected disabled>--선택하세요--</option>";
				products.forEach(function(item, index) {
					// item -> {id:100, name:"기술부"};
					let productNo = item.no;
					let productName = item.name; 
					htmlContent += `<option value="\${productNo}"\${productNo == savedProduct ? 'selected' : ''}> \${productName}</option>`;
				});
				// 4. 화면에 html 컨텐츠 반영시키기
				document.getElementById("product").innerHTML = htmlContent;
			}
		}
		// 2. XMLHttpRequest 객체 초기화하기(요청방식, 요청URL 지정)
		xhr.open("GET", "modifyselect.jsp?cNo=" + catNo + "&bNo=" + boardNo);
		// 3. 서버로 요청 보내기
		xhr.send(null);
	}
</script>
</body>
</html>