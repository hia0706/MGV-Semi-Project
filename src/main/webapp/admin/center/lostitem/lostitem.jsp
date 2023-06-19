<%@page import="dto.Pagination1"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="dto.LostitemDto"%>
<%@page import="vo.Lostitem"%>
<%@page import="java.util.List"%>
<%@page import="dto.Pagination"%>
<%@page import="dao.LostitemDao"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터값 조회
	int theaterNo = Integer.parseInt(request.getParameter("no"));
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	// 공지사항정보 조회하기
	LostitemDao lostitemDao = LostitemDao.getInstance();
	int totalRows = lostitemDao.getTotalRowsByTheater(theaterNo);
	
	Pagination1 pagination = new Pagination1(pageNo, totalRows);

	
	// 데이터 조회하기
	List<Lostitem> lostimeList = lostitemDao.getLostitemByTheaterNo(theaterNo, pagination.getBegin(), pagination.getEnd());
	
	LostitemDto lostitemDto = new LostitemDto();
	lostitemDto.setTotalRows(totalRows);
	lostitemDto.setLostimeList(lostimeList);
	lostitemDto.setPagination(pagination);
	
	// json 형식의 텍스트로 변환하기
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	String text = gson.toJson(lostitemDto);
	
	// 텍스트를 응답으로 보내기
	out.write(text);
%>