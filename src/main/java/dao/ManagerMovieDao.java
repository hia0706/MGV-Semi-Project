package dao;

import java.util.List;

import util.DaoHelper;
import vo.Movie;

public class ManagerMovieDao {

	
	private static ManagerMovieDao instance = new ManagerMovieDao();
	private ManagerMovieDao() {}
	public static ManagerMovieDao getInstance() {
		return instance;
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
			movie.setReleaseDate(rs.getDate("movie_release_date"));
			movie.setDisable(rs.getString("movie_disable"));
			
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
			movie.setReleaseDate(rs.getDate("movie_release_date"));
			movie.setDisable(rs.getString("movie_disable"));
			
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
													    movie.getReleaseDate());
	}
}
