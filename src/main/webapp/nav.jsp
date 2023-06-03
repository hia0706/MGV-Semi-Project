<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginType = (String) session.getAttribute("loginType");
	String loginId = (String) session.getAttribute("loginId");

	String menu = request.getParameter("menu");

%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3 ">
		<a href="home.jsp">
           <img src="/mgv/images/mgv.png" alt="mgv" width="80" height="50" class="">
        </a>
	<div class="container">
    	<ul class="navbar-nav me-auto">
        	<li class="nav-item"><a class="nav-link <%="홈".equals(menu) ? "active" : "" %>" href="/mgv/home.jsp">홈</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="무비".equals(menu) ? "active" : "" %>" href="/mgv/movie.jsp">무비</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="극장".equals(menu) ? "active" : "" %>" href="/mgv/teater.jsp">극장</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="스토어".equals(menu) ? "active" : "" %>" href="/mgv/product.jsp">스토어</a></li>    	
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
         	<li class="nav-item"><a class="nav-link <%="로그인".equals(menu) ? "active" : "" %>" id="login" onclick="login();" href="/mgv/loginform.jsp">로그인</a></li>
        	<li class="nav-item"><a class="nav-link <%="회원가입".equals(menu) ? "active" : "" %>" id="join" onclick="join();" href="/mgv/member/joinform.jsp">회원가입</a></li>   
<%
	}
%>
      	</ul>
   	</div>
	        	<a href="/mgv/manager-loginform.jsp">
	           <img src="/mgv/images/manager.png" alt="mgv" width="5" height="5" class="" >
	        	</a>
</nav>