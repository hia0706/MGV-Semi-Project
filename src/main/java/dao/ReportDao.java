package dao;

import java.util.List;

import util.DaoHelper;
import vo.Location;
import vo.MboardReport;
import vo.Member;
import vo.Product;
import vo.ProductCategory;
import vo.ReportReason;
import vo.SboardReport;
import vo.StoreBoard;
import vo.TboardReport;
import vo.Theater;
import vo.TheaterBoard;

public class ReportDao {
	
	private static ReportDao instance = new ReportDao();
	private ReportDao() {}
	public static ReportDao getInstance() {
		return instance;
	}
	
	public List<ReportReason> getReportReasonrs() {
		
		return DaoHelper.selectList("reportReasonDao.getReportReason", rs -> {
			 ReportReason reportReason = new ReportReason();
			 reportReason.setNo(rs.getInt("reason_no"));
			 reportReason.setName(rs.getString("reason_name"));
			 
			 return reportReason;
		});
	}
	
	// 극장 신고 게시판 관련 메서드
	public void insertTboardReport (TboardReport tboardReport) {
		
		DaoHelper.update("reportDao.insertTboardReport", tboardReport.getReasonContent(),
														 tboardReport.getReason().getNo(),
														 tboardReport.getTheaterBoard().getNo());
	}
	
	public TboardReport getTboardReportByBoardNo(int boardNo) {
		
		return DaoHelper.selectOne("reportDao.getTboardReportByBoardNo", rs -> {
			TboardReport report = new TboardReport();
			report.setNo(rs.getInt("report_no"));
			report.setReasonContent(rs.getString("report_reason"));
			
			ReportReason reason = new ReportReason();
			reason.setNo(rs.getInt("reason_no"));
			reason.setName(rs.getString("reason_name"));
			report.setReason(reason);
			
			TheaterBoard board = new TheaterBoard();
			board.setNo(rs.getInt("board_no"));
			report.setTheaterBoard(board);
			
			return report;
		}, boardNo);
	}
	
	public List<TheaterBoard> getTheaterBoardByReport(int begin, int end) {
		
		return DaoHelper.selectList("reportDao.getTboardByreport", rs -> {
			TheaterBoard theaterBoard = new TheaterBoard();
			
			theaterBoard.setNo(rs.getInt("board_no"));
			theaterBoard.setName(rs.getString("board_name"));
			theaterBoard.setContent(rs.getString("board_content"));
			theaterBoard.setGrade(rs.getString("board_grade"));
			theaterBoard.setCreateDate(rs.getDate("board_create_date"));
			theaterBoard.setUpdateDate(rs.getDate("board_update_date"));
			theaterBoard.setReadCnt(rs.getInt("board_read_cnt"));
			theaterBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			theaterBoard.setDeleted(rs.getString("board_deleted"));
			theaterBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			theaterBoard.setMember(member);
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			theaterBoard.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			theaterBoard.setLocation(location);
			
			return theaterBoard;
		}, begin, end);
	}
	
	public List<TheaterBoard> getTheaterBoardByreportAndTheaterNo(int theaterNo, int begin, int end) {
		
		return DaoHelper.selectList("reportDao.getTboardByreportAndTno", rs -> {
			TheaterBoard theaterBoard = new TheaterBoard();
			
			theaterBoard.setNo(rs.getInt("board_no"));
			theaterBoard.setName(rs.getString("board_name"));
			theaterBoard.setContent(rs.getString("board_content"));
			theaterBoard.setGrade(rs.getString("board_grade"));
			theaterBoard.setCreateDate(rs.getDate("board_create_date"));
			theaterBoard.setUpdateDate(rs.getDate("board_update_date"));
			theaterBoard.setReadCnt(rs.getInt("board_read_cnt"));
			theaterBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			theaterBoard.setDeleted(rs.getString("board_deleted"));
			theaterBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			theaterBoard.setMember(member);
			
			Theater theater = new Theater();
			theater.setNo(rs.getInt("theater_no"));
			theater.setName(rs.getString("theater_name"));
			theaterBoard.setTheater(theater);
			
			Location location = new Location();
			location.setNo(rs.getInt("location_no"));
			location.setName(rs.getString("location_name"));
			theaterBoard.setLocation(location);
			
			return theaterBoard;
		}, theaterNo, begin, end);
	}
	
	public int getTotalRowsByReport() {
		
		return DaoHelper.selectOne("reportDao.getTotalRowsByReport", rs -> {
			
			return rs.getInt("cnt");
		});
	}
	
	public int getTotalRowsByReportAndTno(int Tno) {
		
		return DaoHelper.selectOne("reportDao.getTotalRowsByReportAndTno", rs -> {
			
			return rs.getInt("cnt");
		}, Tno);
	}
	
	// 스토어 게시판 신고 관련 메서드
	public void insertSboardReport (SboardReport sboardReport) {
		
		DaoHelper.update("reportDao.insertSboardReport", sboardReport.getReasonContent(),
														 sboardReport.getReason().getNo(),
														 sboardReport.getStoreBoard().getNo());
	}
	
	public SboardReport getPboardReportByBoardNo(int boardNo) {
		
		return DaoHelper.selectOne("reportDao.getPboardReportByBoardNo", rs -> {
			SboardReport report = new SboardReport();
			report.setNo(rs.getInt("report_no"));
			report.setReasonContent(rs.getString("report_reason"));
			
			ReportReason reason = new ReportReason();
			reason.setNo(rs.getInt("reason_no"));
			reason.setName(rs.getString("reason_name"));
			report.setReason(reason);
			
			StoreBoard board = new StoreBoard();
			board.setNo(rs.getInt("board_no"));
			report.setStoreBoard(board);
			
			return report;
		}, boardNo);
	}
	
	public List<StoreBoard> getStoreBoardByReport(int begin, int end) {
		
		return DaoHelper.selectList("reportDao.getPboardByreport", rs -> {
			StoreBoard storeBoard = new StoreBoard();
			
			storeBoard.setNo(rs.getInt("board_no"));
			storeBoard.setName(rs.getString("board_name"));
			storeBoard.setContent(rs.getString("board_content"));
			storeBoard.setGrade(rs.getString("board_grade"));
			storeBoard.setCreateDate(rs.getDate("board_create_date"));
			storeBoard.setUpdateDate(rs.getDate("board_update_date"));
			storeBoard.setReadCnt(rs.getInt("board_read_cnt"));
			storeBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			storeBoard.setDeleted(rs.getString("board_deleted"));
			storeBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			storeBoard.setMember(member);
			
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			storeBoard.setProduct(product);
			
			ProductCategory category = new ProductCategory();
			category.setNo(rs.getInt("cat_no"));
			category.setName(rs.getString("cat_name"));
			storeBoard.setCategory(category);
			
			return storeBoard;
		}, begin, end);
	}
	
	public List<StoreBoard> getStoreBoardByreportAndProductNo(int productNo, int begin, int end) {
		
		return DaoHelper.selectList("reportDao.getPboardByreportAndPno", rs -> {
			StoreBoard storeBoard = new StoreBoard();
			
			storeBoard.setNo(rs.getInt("board_no"));
			storeBoard.setName(rs.getString("board_name"));
			storeBoard.setContent(rs.getString("board_content"));
			storeBoard.setGrade(rs.getString("board_grade"));
			storeBoard.setCreateDate(rs.getDate("board_create_date"));
			storeBoard.setUpdateDate(rs.getDate("board_update_date"));
			storeBoard.setReadCnt(rs.getInt("board_read_cnt"));
			storeBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			storeBoard.setDeleted(rs.getString("board_deleted"));
			storeBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			storeBoard.setMember(member);
			
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			storeBoard.setProduct(product);
			
			ProductCategory category = new ProductCategory();
			category.setNo(rs.getInt("cat_no"));
			category.setName(rs.getString("cat_name"));
			storeBoard.setCategory(category);
			
			return storeBoard;
		}, productNo, begin, end);
	}
	
	public int getPBTotalRowsByReport() {
		
		return DaoHelper.selectOne("reportDao.getPBTotalRowsByReport", rs -> {
			
			return rs.getInt("cnt");
		});
	}
	
	public int getPBTotalRowsByReportAndPno(int Pno) {
		
		return DaoHelper.selectOne("reportDao.getPBTotalRowsByReportAndPno", rs -> {
			
			return rs.getInt("cnt");
		}, Pno);
	}
	
	// 영화 게시판 신고 관련 메서드
	public void insertMboardReport (MboardReport mboardReport) {
		
		DaoHelper.update("reportDao.insertSboardReport", mboardReport.getReasonContent(),
														 mboardReport.getReason().getNo(),
														 mboardReport.getMovieBoard().getNo());
	}
}
