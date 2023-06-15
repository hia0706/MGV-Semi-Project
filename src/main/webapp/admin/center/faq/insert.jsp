<%@page import="dao.FaqDao"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="vo.Faq"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//세션에서 로그인된 사용자 정보를 조회한다
	String id = (String) session.getAttribute("loginId");

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	if (member == null) {
		response.sendRedirect("../../../member/loginform.jsp?err=req&job="+URLEncoder.encode("고객센터 관리", "utf-8"));
		return;
	}
	
	// 요청 파라미터값 조회
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 요청파라미터 값 저장하기
	Faq faq = new Faq();
	faq.setTitle(title);
	faq.setContent(content);
	faq.setMember(new Member(id));
	
	FaqDao faqDao = FaqDao.getInstance();
	faqDao.insertFaq(faq);
	
	response.sendRedirect("list.jsp");
	
	

%>
