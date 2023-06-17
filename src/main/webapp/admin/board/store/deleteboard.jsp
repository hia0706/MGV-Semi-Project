<%@page import="dto.SBoardDto"%>
<%@page import="vo.StoreBoard"%>
<%@page import="dao.StoreBoardDao"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="dao.ReportDao"%>
<%@page import="dto.TBoardDto"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="dto.Pagination"%>
<%@page import="util.StringUtils"%>
<%@page import="java.util.List"%>
<%@page import="dao.TheaterBoardDao"%>
<%@page import="vo.TheaterBoard"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<%
	// 요청 파라미터값 조회
	int productNo = Integer.parseInt(request.getParameter("no"));
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);	

	// 게시판정보 조회하기 (상품번호가 일치하고, delete = Y)
	StoreBoardDao storeBoardDao = StoreBoardDao.getInstance();
	
	//
	int totalRows = storeBoardDao.getDelTotalRowsByProduct(productNo);
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	pagination.setbeginPage(pagination.getBeginPage());
	pagination.setendPage(pagination.getEndPage()); 
	pagination.setPageNo(pageNo);
	
	// 데이터 조회하기
	//
	List<StoreBoard> storeBoards = storeBoardDao.getAllDelStoreBoardsByProductNo(productNo, pagination.getBegin(), pagination.getEnd());
	
	SBoardDto sBoardDto = new SBoardDto();
	sBoardDto.setPagination(pagination);
	sBoardDto.setStoreBoards(storeBoards);
	sBoardDto.setTotalRows(totalRows);
	
	
	// json 형식의 텍스트로 변환하기
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	String text = gson.toJson(sBoardDto);
	
	// 텍스트를 응답으로 보내기
	out.write(text);
%>