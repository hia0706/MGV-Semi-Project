<%@page import="com.google.gson.Gson"%>
<%@page import="dto.PaymentDto"%>
<%@page import="vo.Payment"%>
<%@page import="java.util.List"%>
<%@page import="dto.Pagination"%>
<%@page import="dao.PaymentDao"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	String status = request.getParameter("status");
	
	// 결제정보 조회
	PaymentDao paymentDao = PaymentDao.getInstance();
	// 전체 결제정보 (loginId 기준) if 문 status 있는지 없는지
	if (status == null) {
		int totalRows = paymentDao.getTotalRowsById(loginId);
	} else {
		int totalRows = paymentDao.getTotalRowsByIdandStatus(loginId, status);
	}
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	pagination.setbeginPage(pagination.getbeginPage());
	pagination.setendPage(pagination.getEndPage());
	pagination.setPageNo(pageNo);
	
	// 데이터 조회 if문 status 있을때 없을때
	if (status == null) {
		List<Payment> payments = paymentDao.getAllPaymentsById(loginId, pagination.getBegin(), pagination.getEnd());
	} else {
		List<Payment> payments = paymentDao.getAllPaymentsByIdandStatus(loginId, status, pagination.getBegin(), pagination.getEnd());
	}
	
	PaymentDto paymentDto = new PaymentDto();
	paymentDto.setTotalRows(totalRows);
	paymentDto.setPayments(payments);
	paymentDto.setPagination(pagination);
	
	// json 형식의 텍스트 변환
	Gson gson = new Gson();
	String text = gson.toJson(paymentDto);
	
	// 텍스트를 응답으로 보내기
	out.write(text);
%>
