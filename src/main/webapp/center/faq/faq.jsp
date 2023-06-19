<%@page import="dto.Pagination1"%>
<%@page import="dto.FaqDto"%>
<%@page import="vo.Faq"%>
<%@page import="dao.FaqDao"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="dto.Pagination"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<%
	// 요청 파라미터값 조회
	int categoryNo = Integer.parseInt(request.getParameter("no"));
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	// 자주묻는질문 정보 조회하기
	FaqDao faqDao = FaqDao.getInstance();
	int totalRows = faqDao.getTotalRowsByCategory(categoryNo);
	
	Pagination1 pagination = new Pagination1(pageNo, totalRows);
	
	// 데이터 조회하기
	List<Faq> faqList = faqDao.getFaqByCategoryNo(categoryNo, pagination.getBegin(), pagination.getEnd());
	
	FaqDto faqDto = new FaqDto();
	faqDto.setTotalRows(totalRows);
	faqDto.setFaqList(faqList);
	faqDto.setPagination(pagination);
	
	// json 형식의 텍스트로 변환하기
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	String text = gson.toJson(faqDto);
	
	// 텍스트를 응답으로 보내기
	out.write(text);
%>