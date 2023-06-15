package dao;

import java.util.List;

import util.DaoHelper;
import vo.ReportReason;
import vo.SboardReport;
import vo.TboardReport;

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
	
	// 극장 신고 관련 메서드
	public void insertTboardReport (TboardReport tboardReport) {
		
		DaoHelper.update("reportDao.insertTboardReport", tboardReport.getReasonContent(),
														 tboardReport.getReason().getNo(),
														 tboardReport.getTheaterBoard().getNo());
	}
	
	// 스토어 신고 관련 메서드
	public void insertSboardReport (SboardReport sboardReport) {
		
		DaoHelper.update("reportDao.insertSboardReport", sboardReport.getReasonContent(),
														 sboardReport.getReason().getNo(),
														 sboardReport.getStoreBoard().getNo());
	}
}
