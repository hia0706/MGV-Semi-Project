<%@page import="dto.Pagination1"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="dto.SBoardDto"%>
<%@page import="vo.StoreBoard"%>
<%@page import="dao.StoreBoardDao"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="dto.Pagination"%>
<%@page import="util.StringUtils"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<%
	// 요청 파라미터값 조회
	int productNo = Integer.parseInt(request.getParameter("no"));
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);	

	// 게시판정보 조회하기
	StoreBoardDao storeBoardDao = StoreBoardDao.getInstance();
	int totalRows = storeBoardDao.getTotalRowsByProduct(productNo);
	
	Pagination1 pagination = new Pagination1(pageNo, totalRows);
	
	// 데이터 조회하기
	List<StoreBoard> storeBoards = storeBoardDao.getAllStoreBoardsByProductNo(productNo, pagination.getBegin(), pagination.getEnd());
	
	SBoardDto sBoardDto = new SBoardDto();
	sBoardDto.setTotalRows(totalRows);
	sBoardDto.setStoreBoards(storeBoards);
	sBoardDto.setPagination(pagination);
	
	
	// json 형식의 텍스트로 변환하기
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	String text = gson.toJson(sBoardDto);
	
	// 텍스트를 응답으로 보내기
	out.write(text);
%>