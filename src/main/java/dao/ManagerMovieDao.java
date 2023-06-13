package dao;

import java.util.HashSet;
import java.util.List;

import util.DaoHelper;
import vo.Movie;

public class ManagerMovieDao {

	
	private static ManagerMovieDao instance = new ManagerMovieDao();
	private ManagerMovieDao() {}
	public static ManagerMovieDao getInstance() {
		return instance;
	}
	
	public List<Movie> getMovieChart(){
		return DaoHelper.selectList("managermovieDao.getMovieChart", rs -> {
			Movie movie = new Movie();
			movie.setNo(rs.getInt("movie_no"));
			movie.setRank(rs.getInt("movie_rank"));
			movie.setTitle(rs.getString("movie_title"));
			movie.setGenre(rs.getString("movie_genre"));
			movie.setDirector(rs.getString("movie_director"));
			movie.setCast(rs.getString("movie_cast"));
			movie.setDescription(rs.getString("movie_description"));
			movie.setIsPlaying(rs.getString("movie_isplaying"));
			movie.setAudiCnt(rs.getInt("movie_audicnt"));
			movie.setPosterURL(rs.getString("movie_posterurl"));
			movie.setRankOldAndNew(rs.getString("movie_rankoldandnew"));
			movie.setReleaseDate(rs.getDate("movie_release_date"));
			movie.setUpdateDate(rs.getDate("movie_update_date"));
			return movie;
		});
	}
	
	public List<Movie> getMovies() {
		return DaoHelper.selectList("managermovieDao.getMovies", rs -> {
			Movie movie = new Movie();
			movie.setNo(rs.getInt("movie_no"));
			movie.setRank(rs.getInt("movie_rank"));
			movie.setTitle(rs.getString("movie_title"));
			movie.setGenre(rs.getString("movie_genre"));
			movie.setDirector(rs.getString("movie_director"));
			movie.setCast(rs.getString("movie_cast"));
			movie.setDescription(rs.getString("movie_description"));
			movie.setIsPlaying(rs.getString("movie_isplaying"));
			movie.setAudiCnt(rs.getInt("movie_audicnt"));
			movie.setPosterURL(rs.getString("movie_posterurl"));
			movie.setRankOldAndNew(rs.getString("movie_rankoldandnew"));
			movie.setReleaseDate(rs.getDate("movie_release_date"));
			movie.setUpdateDate(rs.getDate("movie_update_date"));
			return movie;
		});
	}
	
	public Movie getMovieByNo(int movieNo) {
		return DaoHelper.selectOne("managermovieDao.getMovieByNo", rs -> {
			Movie movie = new Movie();
			movie.setNo(rs.getInt("movie_no"));
			movie.setRank(rs.getInt("movie_rank"));
			movie.setTitle(rs.getString("movie_title"));
			movie.setGenre(rs.getString("movie_genre"));
			movie.setDirector(rs.getString("movie_director"));
			movie.setCast(rs.getString("movie_cast"));
			movie.setDescription(rs.getString("movie_description"));
			movie.setIsPlaying(rs.getString("movie_isplaying"));
			movie.setAudiCnt(rs.getInt("movie_audicnt"));
			movie.setPosterURL(rs.getString("movie_posterurl"));
			movie.setRankOldAndNew(rs.getString("movie_rankoldandnew"));
			movie.setReleaseDate(rs.getDate("movie_release_date"));
			movie.setUpdateDate(rs.getDate("movie_update_date"));
			return movie;
		}, movieNo);
	}
	
	public void insertMovie(Movie movie) {
		DaoHelper.update("managermovieDao.insertMovie", movie.getNo(),
													    movie.getRank(),
													    movie.getTitle(),
													    movie.getGenre(),
													    movie.getDirector(),
													    movie.getCast(),
													    movie.getDescription(),
													    "Y".equals(movie.getIsPlaying())? "Y" :"N",
													    movie.getRankInten(),
													    movie.getAudiCnt(),
													    movie.getPosterURL(),
													    movie.getRankOldAndNew(),
													    movie.getReleaseDate());
	}
	
	public void updateMovie(Movie movie) {
		DaoHelper.update("managermovieDao.updateMovie", movie.getRank(),
													"Y".equals(movie.getIsPlaying())? "Y" :"N",
														movie.getRankInten(),
														movie.getAudiCnt(),
														movie.getPosterURL(),
														movie.getRankOldAndNew(),
														movie.getNo());
		
		
	}
	
	public HashSet<Integer> getMovieNos(){
		return DaoHelper.selectSet("managermovieDao.getMovies", rs -> {
			int movieNo=rs.getInt("movie_no");
			return movieNo;
		});
	}
	
	public void initChart(int movieNo) {
		DaoHelper.update("managermovieDao.initChart", movieNo);
	}
	
}
