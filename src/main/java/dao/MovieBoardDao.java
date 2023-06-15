package dao;

import java.util.List;

import util.DaoHelper;
import vo.Member;
import vo.Movie;
import vo.MovieBoard;

public class MovieBoardDao {
	
	private static MovieBoardDao instance = new MovieBoardDao();
	private MovieBoardDao() {}
	public static MovieBoardDao getInstance() {
		return instance;
	}
	
	// 전체 데이터 행의 갯수
	public int getTotalRows() {
		
		return DaoHelper.selectOne("movieBoardDao.totalRows", rs -> {
			return rs.getInt("cnt");
		});
		
	}
	
	public int getTotalRowsByMovieNo(int movieNo) {
		
		return DaoHelper.selectOne("movieBoardDao.totalRowsByMovieNo", rs -> {
			
			return rs.getInt("cnt");
		}, movieNo);
	}
	
	
	// select
	public List<MovieBoard> getAllMovieBoards(int begin, int end) {
		
		return DaoHelper.selectList("movieBoardDao.getAllMovieBoards", rs -> {
			MovieBoard movieBoard = new MovieBoard();
			
			movieBoard.setNo(rs.getInt("board_no"));
			movieBoard.setName(rs.getString("board_name"));
			movieBoard.setContent(rs.getString("board_content"));
			movieBoard.setGrade(rs.getString("board_grade"));
			movieBoard.setCreateDate(rs.getDate("board_create_date"));
			movieBoard.setUpdateDate(rs.getDate("board_update_date"));
			movieBoard.setReadCnt(rs.getInt("board_read_cnt"));
			movieBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			movieBoard.setDeleted(rs.getString("board_deleted"));
			movieBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			movieBoard.setMember(member);
			
			Movie movie = new Movie();
			movie.setNo(rs.getInt("movie_no"));
			movieBoard.setMovie(movie);
			
			return movieBoard;	
		}, begin, end);
	}
}
