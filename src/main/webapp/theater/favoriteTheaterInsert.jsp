<%@page import="vo.Theater"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.FavoriteTheaterDao"%>
<%@page import="vo.FavoriteTheater"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");
	
	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);


	if (member == null) {
		response.sendRedirect("../member/loginform.jsp?err=req&job="+URLEncoder.encode("즐겨찾기추가", "utf-8"));
		return;
	}
	
	// 파라미터 극장번호
	int theaterNo = Integer.parseInt(request.getParameter("no"));
	Theater theater = new Theater();
	theater.setNo(theaterNo);
	
	// 자주가는 극장 정보 가져오기
	FavoriteTheaterDao fTheaterDao = FavoriteTheaterDao.getInstance();
	
	// vo에담기
	FavoriteTheater favorite = new FavoriteTheater();
	favorite.setMember(member);
	favorite.setTheater(theater);
	
	// 등록된 극장의 갯수가 3개 이상인지 비교
	List<FavoriteTheater> FTList = fTheaterDao.getFavoriteTheaterById(id);
	if(FTList.size()>=3){
	// 3개 이상이면 극장상세정보로 리스폰스
		response.sendRedirect("../theater/detail.jsp?no="+theaterNo+"&err=overFlow&job="+URLEncoder.encode("즐겨찾기추가", "utf-8"));
		return;
	};
	
	// 이미 등록된 극장인지 비교
	if(fTheaterDao.getFavoriteTheaterByKey(id, theaterNo)!=null){
	// 이미 등록된 극장이면 극장상세정보로 리스폰스		
		response.sendRedirect("../theater/detail.jsp?no="+theaterNo+"&err=haveThis&job="+URLEncoder.encode("즐겨찾기추가", "utf-8"));
		return;
	}
	// 2개 이하이고 등록되지 않은 극장이면 추가.
	fTheaterDao.insertFavoriteTheater(favorite);
	//돌아가기
	response.sendRedirect("../theater/detail.jsp?no="+theaterNo);
	
%>