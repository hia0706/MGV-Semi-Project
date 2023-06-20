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
	
	public MovieBoard getMovieBoardByBoardNo(int boardNo) {
		return DaoHelper.selectOne("movieBoarDao.getBoardByNo", rs -> {
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
			movieBoard.setFileName(rs.getString("BORAD_FILENAME"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			movieBoard.setMember(member);
			
			Movie movie = new Movie();
			movie.setNo(rs.getInt("movie_no"));
			movie.setTitle(rs.getString("movie_title"));
			movieBoard.setMovie(movie);
			
			return movieBoard;	
		}, boardNo);
		
	}
	
	
	// insert, update
	public void insertMovieBoard(MovieBoard movieBoard) {
		
		DaoHelper.update("movieBoardDao.insertMovieBoard" ,movieBoard.getName(),
														   movieBoard.getContent(),
														   movieBoard.getGrade(),
														   movieBoard.getMember().getId(),
														   movieBoard.getMovie().getNo(),
														   movieBoard.getFileName());
	}
	
	public void updateMovieBoard(MovieBoard movieBoard) {
		
		DaoHelper.update("movieBoardDao.updateBoardByNo", movieBoard.getName(),
														  movieBoard.getContent(),
														  movieBoard.getGrade(),
														  movieBoard.getReadCnt(),
														  movieBoard.getCommentCnt(),
													   	  movieBoard.getDeleted(),
														  movieBoard.getReport(),
														  movieBoard.getMovie().getNo(),
														  movieBoard.getNo());
	} 
	
	public void updateMovieBoardFile(MovieBoard movieBoard) {
		
		DaoHelper.update("movieBoardDao.updateBoardByNoFile", movieBoard.getName(),
														  movieBoard.getContent(),
														  movieBoard.getGrade(),
														  movieBoard.getReadCnt(),
														  movieBoard.getCommentCnt(),
													   	  movieBoard.getDeleted(),
														  movieBoard.getReport(),
														  movieBoard.getMovie().getNo(),
														  movieBoard.getFileName(),
														  movieBoard.getNo());
	} 
	
	// 검색기능 관련
	
	/**
	 * 전달받은 검색 조건에 해당하는 책 갯수를 반환한다.
	 * @param opt 검색옵션("title(영화제목)", "name(게시글제목)", "writer" 중 하나다.)
	 * @param keyword 검색키워드
	 * @return 검색 조건에 해당하는 책 갯수
	 */
	public int getTotalRowsByCondition(String opt, String keyword) {
		String sql = "select count(*) cnt ";
		sql       += "from (select * from mgv_movie_board A, mgv_movie B ";
		sql		  += "where A.movie_no = B.movie_no ";
		sql		  += "and board_report = 'N' and board_deleted = 'N' ";
		if ("Mtitle".equals(opt)) {
			sql += "and movie_title like '%' || ? || '%') ";
		} else if("name".equals(opt)) {
			sql += "and board_name like '%' || ? || '%') ";
		} else if("writer".equals(opt)) {
			sql += "and member_id like '%' || ? || '%') ";
		}
		return DaoHelper.selectOne(sql, rs ->{
			return rs.getInt("cnt");
			
		} , keyword);
		
	}

	public List<MovieBoard> getMovieBoaldsByCondition(int begin, int end, String opt, String keyword){
		
		String sql = "select * from (select row_number() over (order by board_no desc) row_number, ";
		sql       += "A.board_no, A.board_name, A.board_content, A.board_grade, A.board_create_date, ";
		sql		  += "A.board_update_date, A.board_read_cnt, A.board_comment_cnt, A.board_deleted, "; 
		sql       += "A.board_report, A.member_id, A.movie_no ";
		sql  	  += "from mgv_movie_board A, mgv_movie B ";
		sql       += "where board_deleted = 'N' and board_report = 'N' ";
		sql       += "and A.movie_no = B.movie_no ";
		
		if ("Mtitle".equals(opt)) {
			sql += "and movie_title like '%' || ? || '%') ";
		} else if("name".equals(opt)) {
			sql += "and board_name like '%' || ? || '%') ";
		} else if("writer".equals(opt)) {
			sql += "and member_id like '%' || ? || '%') ";
		}
		
		sql += "where row_number between ? and ? ";
	
		return DaoHelper.selectList(sql, rs -> {
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
		}, keyword, begin, end);
	}
	

	// 삭제된 영화 게시물 관련
	
	public int getDelTotalRowsByCondition(String opt, String keyword) {
		String sql = "select count(*) cnt ";
		sql       += "from (select * from mgv_movie_board A, mgv_movie B ";
		sql		  += "where A.movie_no = B.movie_no ";
		sql		  += "and board_deleted = 'Y' ";
		if ("Mtitle".equals(opt)) {
			sql += "and movie_title like '%' || ? || '%') ";
		} else if("name".equals(opt)) {
			sql += "and board_name like '%' || ? || '%') ";
		} else if("writer".equals(opt)) {
			sql += "and member_id like '%' || ? || '%') ";
		}
		return DaoHelper.selectOne(sql, rs ->{
			return rs.getInt("cnt");
			
		} , keyword);
		
	}

	public List<MovieBoard> getDelMovieBoardsByCondition(int begin, int end, String opt, String keyword){
		
		String sql = "select * from (select row_number() over (order by board_no desc) row_number, ";
		sql       += "A.board_no, A.board_name, A.board_content, A.board_grade, A.board_create_date, ";
		sql		  += "A.board_update_date, A.board_read_cnt, A.board_comment_cnt, A.board_deleted, "; 
		sql       += "A.board_report, A.member_id, A.movie_no ";
		sql  	  += "from mgv_movie_board A, mgv_movie B ";
		sql       += "where board_deleted = 'Y' ";
		sql       += "and A.movie_no = B.movie_no ";
		
		if ("Mtitle".equals(opt)) {
			sql += "and movie_title like '%' || ? || '%') ";
		} else if("name".equals(opt)) {
			sql += "and board_name like '%' || ? || '%') ";
		} else if("writer".equals(opt)) {
			sql += "and member_id like '%' || ? || '%') ";
		}
		
		sql += "where row_number between ? and ? ";
	
		return DaoHelper.selectList(sql, rs -> {
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
		}, keyword, begin, end);
	}
	
	
	public List<MovieBoard> getDelAllMovieBoards(int begin, int end) {
		
		return DaoHelper.selectList("movieBoardDao.getAllDelMovieBoards", rs -> {
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
	
	public int getDelTotalRows() {
		
		return DaoHelper.selectOne("movieBoardDao.delTotalRows", rs -> {
			return rs.getInt("cnt");
		});
		
	}
	
	// movie관련
	public List<Movie> getMovies() {
		return DaoHelper.selectList("movieBoardDao.getAllMovie", rs -> {
			Movie movie = new Movie();
			movie.setNo(rs.getInt("movie_no"));
			movie.setTitle(rs.getString("movie_title"));
		
			return movie;
		});
	}
}
