<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="dto.PaymentDto"%>
<%@page import="vo.Payment"%>
<%@page import="java.util.List"%>
<%@page import="dto.Pagination1"%>
<%@page import="dao.PaymentDao"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	String status = request.getParameter("status");
	
	// 결제정보 조회
	PaymentDao paymentDao = PaymentDao.getInstance();
	
	int totalRows = 0;
	// 전체 결제정보 (loginId 기준) if 문 status 있는지 없는지
	if ("all".equals(status)) {
		totalRows = paymentDao.getTotalRowsById(loginId);
	} else {
		totalRows = paymentDao.getTotalRowsByIdandStatus(loginId, status);
	}
	
	Pagination1 pagination = new Pagination1(pageNo, totalRows);
	
	List<Payment> payments = null;
	// 데이터 조회 if문 status 있을때 없을때
	if ("all".equals(status)) {
		payments = paymentDao.getAllPaymentsById(loginId, pagination.getBegin(), pagination.getEnd());
	} else {
		payments = paymentDao.getPaymentsByIdandStatus(loginId, status, pagination.getBegin(), pagination.getEnd());
	}
	
	PaymentDto paymentDto = new PaymentDto();
	paymentDto.setTotalRows(totalRows);
	paymentDto.setPayments(payments);
	paymentDto.setPagination(pagination);
	
	// json 형식의 텍스트 변환 
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create(); 
	String text = gson.toJson(paymentDto);
	
	// 텍스트를 응답으로 보내기
	out.write(text);
	System.out.println(text);
%>
