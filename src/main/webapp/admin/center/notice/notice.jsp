<%@page import="dto.TBoardDto"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="dto.NoticeDto"%>
<%@page import="vo.Notice"%>
<%@page import="java.util.List"%>
<%@page import="dto.Pagination"%>
<%@page import="dao.NoticeDao"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터값 조회
	int theaterNo = Integer.parseInt(request.getParameter("no"));
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	// 공지사항정보 조회하기
	NoticeDao noticeDao = NoticeDao.getInstance();
	int totalRows = noticeDao.getTotalRowsByTheater(theaterNo);
	
	Pagination pagination = new Pagination(pageNo, totalRows);
	pagination.setbeginPage(pagination.getBeginPage());
	pagination.setendPage(pagination.getEndPage());
	pagination.setPageNo(pageNo);
	
	// 데이터 조회하기
	List<Notice> noticeList = noticeDao.getNoticeByTheaterNo(theaterNo, pagination.getBegin(), pagination.getEnd());
	
	NoticeDto noticeDto = new NoticeDto();
	noticeDto.setTotalRows(totalRows);
	noticeDto.setNoticeList(noticeList);
	noticeDto.setPagination(pagination);
	
	// json 형식의 텍스트로 변환하기
	Gson gson = new Gson();
	String text = gson.toJson(noticeDto);
	
	// 텍스트를 응답으로 보내기
	out.write(text);
%>