<%@page import="vo.Member"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginType = (String) session.getAttribute("loginType");
	String loginId = (String) session.getAttribute("loginId");

	String menu = request.getParameter("menu");
	
%>
<style>
 .navbar-nav > li {
	  margin: 10px; 
	  padding: 5px 1px;
	  font-size: 18px;
 }

</style>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-4">
		
	<div class="container-fluid">
		<a href="/mgv/admin/home.jsp">
           <img src="/mgv/images/member/mgv.png" alt="mgv" width="70" height="50" class="d-inline-block align-text-top">
        </a>
    	<ul class="navbar-nav me-auto">
        	<li class="nav-item"><a class="nav-link <%="회원 관리".equals(menu) ? "active" : "" %>" href="/mgv/admin/member/list.jsp">회원 관리</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="영화 관리".equals(menu) ? "active" : "" %>" href="/mgv/admin/movie/list.jsp">영화 관리</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="극장 관리".equals(menu) ? "active" : "" %>" href="/mgv/admin/theater/list.jsp">극장 관리</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="스토어 관리".equals(menu) ? "active" : "" %>" href="/mgv/admin/product/list.jsp">스토어 관리</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="게시판 관리".equals(menu) ? "active" : "" %>" href="/mgv/admin/board/home.jsp">게시판 관리</a></li>    	
      	</ul>
<%
	if (loginId != null) {
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
         	<li class="nav-item"><a class="nav-link " href="/mgv/member/login/logout.jsp">로그아웃</a></li>
         	
         		<li class="nav-item"><a class="nav-link <%="고객센터".equals(menu) ? "active" : "" %>" href="/mgv/admin/center/home.jsp" style="font-size: 12px">고객센터</a></li>
      	</ul>	
   	</div>
   			
</nav>