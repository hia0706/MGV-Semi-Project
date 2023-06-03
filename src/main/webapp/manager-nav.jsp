<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginType = (String) session.getAttribute("loginType");
	String loginId = (String) session.getAttribute("loginId");

	String menu = request.getParameter("menu");

%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-4">
		
	<div class="container-fluid">
		<a href="manager-home.jsp">
           <img src="./images/mgv.png" alt="mgv" width="70" height="50" class="d-inline-block align-text-top">
        </a>
    	<ul class="navbar-nav me-auto">
        	<li class="nav-item"><a class="nav-link <%="영화 관리".equals(menu) ? "active" : "" %>" href="/mgv/manager/movie.jsp">영화 관리</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="극장 관리".equals(menu) ? "active" : "" %>" href="/mgv/manager/teater.jsp">극장 관리</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="스토어 관리".equals(menu) ? "active" : "" %>" href="/mgv/manager/product.jsp">스토어 관리</a></li>    	
      	</ul>
<%
	if (loginType != null) {
%>
		<span class="navbar-text me-5">
			<strong class="text-white bolder"><%=loginId %></strong>님 환영합니다.
		</span>
<%		
	}
%>      	
      	<ul class="navbar-nav">
      	<!-- 장바구니 보류 -->
        	<%-- <li class="nav-item"><a class="nav-link <%="장바구니".equals(menu) ? "active" : "" %>" href="/movie/cart.jsp">장바구니</a></li>   --%>  	
<%
	if (loginId != null) {
%>
         	<li class="nav-item"><a class="nav-link " href="/mgv/logout.jsp">로그아웃</a></li>
<%
	} else {
%>
         	<li class="nav-item"><a class="nav-link <%="로그인".equals(menu) ? "active" : "" %>" href="/mgv/manager-loginform.jsp">로그인</a></li>
<%
	}
%>
      	</ul>	
   	</div>
   			<a href="./home.jsp">
           <img src="./images/manager.png" alt="mgv" width="5" height="5" class="" >
        	</a>	
</nav>