<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="vo.ProductCategory"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductCategoryDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String)session.getAttribute("loginId");

	// 상품 카테고리 불러오기
	ProductCategoryDao productCategoryDao = ProductCategoryDao.getInstance();
	List<ProductCategory> categories = productCategoryDao.getCategories();
	
	// 상품카테고리 번호로 조회된 상품들 불러오기
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
<style>
	.tit-heading-wrap > h3 {
    display: inline-block;
    position: relative;
    height: inherit;
    margin: 0px 40px;
    color: #222;
    font-weight: 500;
    font-size: 30px;
    text-align: left;
    vertical-align: middle;
	}

	.category_wrap {
    position: relative;
    background-color: #fff;
    border-bottom: 1px solid #cacaca;
    z-index: 101;
	}

	.category_contents_wrap {
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;
    width: 980px;
    min-width: 980px;
    margin: 0 auto;
    padding: 11px 0;
    background-color: #fff;
	}

	.category_content {
    display: flex;
    justify-content: space-between;
    position: relative;
    overflow: hidden;
    width: 100%;
    max-width: 740px;
    line-height: 26px;
	}

</style>
</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="스토어"/>
</jsp:include>
<div id="container">
	<div id="contents">
		<div id="divAction"></div>
		<div class="tit-heading-wrap tit-evt">
			<h3>스토어</h3>
		</div>
<script type="text/javascript">
	function fnCategoryData(cno) {
		location.href="http://localhost/mgv/store/store.jsp?cno=" + cno;
	}
</script>
		<div class="category_wrap">
			<div class="category_contents_wrap">
				<ul class="category_content">
<%
	for (ProductCategory productCategory : categories) {
%>
					<li id="<%=productCategory.getNo() %>" >
						<a href="#" onclick="fnCategoryData(<%=productCategory.getNo() %>);"><%=productCategory.getName() %></a>
					</li>
<%
	}
%>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>



















