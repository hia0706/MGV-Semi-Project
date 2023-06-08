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
        	<li class="nav-item"><a class="nav-link <%="극장".equals(menu) ? "active" : "" %>" href="/mgv/theater/theaters.jsp">극장</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="스토어".equals(menu) ? "active" : "" %>" href="/mgv/product.jsp">스토어</a></li>    	
      	</ul>
<%
	if (loginType != null) {
%>
		<div class="dropdown navbar-text me-5">
			<a href="/mgv/member/detail.jsp">
				<img src="/mgv/images/myprofile.png" alt="<%=loginId %>" width="30" height="30">
			</a> 
		  <button class="btn btn-secondary btn-sm dropdown-toggle " type="button" data-bs-toggle="dropdown" aria-expanded="false">
				<strong class="text-white bolder"><%=loginId %>님</strong>
		  </button>
		  <ul class="dropdown-menu dropdown-menu-dark">
			    <li><a class="dropdown-item" href="/mgv/member/detail.jsp">내 정보</a></li>
			    <li><a class="dropdown-item" href="/mgv/member/orderlist.jsp">구매내역</a></li>
		  </ul>
		</div>
		
<%		
	}
%>      	
      	<ul class="navbar-nav">
      	<!-- 장바구니 보류 -->
        	<%-- <li class="nav-item"><a class="nav-link <%="장바구니".equals(menu) ? "active" : "" %>" href="/movie/cart.jsp">장바구니</a></li>   --%>  	
<%
	if (loginId != null) {
%>
         	<li class="nav-item"><a class="nav-link " href="./logout.jsp">로그아웃</a></li>
<%
	} else {
%>
         	<li class="nav-item"><a class="nav-link <%="로그인".equals(menu) ? "active" : "" %>" href="/mgv/loginform.jsp">로그인</a></li>
        	<li class="nav-item"><a class="nav-link <%="회원가입".equals(menu) ? "active" : "" %>" href="/mgv/member/joinform.jsp">회원가입</a></li>   
<%
	}
%>
      	</ul>
   	</div>
	        	<a href="/mgv/manager-loginform.jsp">
	           <img src="/mgv/images/manager.png" alt="mgv" width="5" height="5" class="" >
	        	</a>
</nav>