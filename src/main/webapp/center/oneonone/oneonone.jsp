<%@page import="dto.OneononeDto"%>
<%@page import="vo.Oneonone"%>
<%@page import="dao.OneononeDao"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="dto.Pagination"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터값 조회
	int theaterNo = Integer.parseInt(request.getParameter("no"));
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	// 일대일 문의내역 정보 조회하기
	OneononeDao oneononeDao = OneononeDao.getInstance();
	int totalRows = oneononeDao.getTotalRowsByTheater(theaterNo);
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	pagination.setbeginPage(pagination.getBeginPage());
	pagination.setendPage(pagination.getEndPage());
	pagination.setPageNo(pageNo);
	
	// 데이터 조회하기
	List<Oneonone> oneononeList = oneononeDao.getOneononeByTheaterNo(theaterNo, pagination.getBegin(), pagination.getEnd());
	
	OneononeDto oneononeDto = new OneononeDto();
	oneononeDto.setTotalRows(totalRows);
	oneononeDto.setOneononeList(oneononeList);
	oneononeDto.setPagination(pagination);
	
	// json 형식의 텍스트로 변환하기
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	String text = gson.toJson(oneononeDto);
	
	// 텍스트를 응답으로 보내기
	out.write(text);
%>