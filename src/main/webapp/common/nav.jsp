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
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3 ">
		<a href="/mgv/home.jsp">
           <img src="/mgv/images/member/mgv.png" alt="mgv" width="80" height="50" class="">
        </a>
	<div class="container-fluid">
    	<ul class="navbar-nav me-auto">
        	<li class="nav-item"><a class="nav-link <%="홈".equals(menu) ? "active" : "" %>" href="/mgv/home.jsp">홈</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="무비".equals(menu) ? "active" : "" %>" href="/mgv/movie/list.jsp">무비</a></li>    	
        	<li class="nav-item"><a class="nav-link <%="극장".equals(menu) ? "active" : "" %>" href="/mgv/theater/theaters.jsp">극장</a></li>    
        	<li class="nav-item"><a class="nav-link <%="스토어".equals(menu) ? "active" : "" %>" href="/mgv/store/store.jsp">스토어</a></li>    	
        	<li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	              게시판
	            </a>
	            <ul class="dropdown-menu">
	              <li><a class="dropdown-item" href="/mgv/board/theater/list.jsp">극장</a></li>
	              <li><a class="dropdown-item" href="/mgv/board/movie/list.jsp">영화</a></li>
	              <li><a class="dropdown-item" href="/mgv/board/store/list.jsp">스토어</a></li>
<%--
	              <li><hr class="dropdown-divider"></li>
	              <li><a class="dropdown-item" href="#">공지사항</a></li>

--%>            
            	</ul>
            </li>	
      	</ul>
<%
	if (loginType != null) {
%>
		<div class="dropdown navbar-text me-5">
			<a href="/mgv/member/info/detail.jsp">
				<img src="/mgv/images/member/myprofile.png" alt="<%=loginId %>" width="30" height="30">
			</a> 
		  <button class="btn btn-secondary btn-sm dropdown-toggle " type="button" data-bs-toggle="dropdown" aria-expanded="false">
				<strong class="text-white bolder <%=loginId.equals(menu) ? "active" : "" %>"><%=loginId %>님</strong>
		  </button>
		  <ul class="dropdown-menu dropdown-menu-dark">
			    <li><a class="dropdown-item" href="/mgv/member/info/detail.jsp">내 정보</a></li>
			    <li><a class="dropdown-item" href="/mgv/member/user-cart.jsp">장바구니</a></li>			    
			    <li><a class="dropdown-item" href="/mgv/member/buy/paylist.jsp">결제내역</a></li>
			    <li><a class="dropdown-item" href="/mgv/center/oneonone/list.jsp">내 문의내역</a></li>
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
         	<li class="nav-item"><a class="nav-link " href="/mgv/member/login/logout.jsp">로그아웃</a></li>
<%
	} else {
%>
         	<li class="nav-item"><a class="nav-link <%="로그인".equals(menu) ? "active" : "" %>" href="/mgv/member/login/form.jsp">로그인</a></li>
        	<li class="nav-item"><a class="nav-link <%="회원가입".equals(menu) ? "active" : "" %>" href="/mgv/member/join/form.jsp">회원가입</a></li>   
<%
	}
%>
           	<li class="nav-item"><a class="nav-link <%="고객센터".equals(menu) ? "active" : "" %>" href="/mgv/center/home.jsp" style="font-size: 12px">고객센터</a></li>
      	</ul>
   	</div>
</nav>