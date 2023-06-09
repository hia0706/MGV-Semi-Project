package vo;

import java.util.Date;

public class Movie {

	private int no;
	private int rank;
	private int rankInten;
	private int audiCnt;
	private String title;
	private String genre;
	private String director;
	private String cast;
	private String description;
	private String posterURL;
	private String releaseDate;
	private String isPlaying;
	public String getIsPlaying() {
		return isPlaying;
	}

	public void setIsPlaying(String isPlaying) {
		this.isPlaying = isPlaying;
	}


	public Movie() {}

	public int getNo() {
		return no;
	}

	public String getPosterURL() {
		return posterURL;
	}

	public int getRankInten() {
		return rankInten;
	}

	public void setRankInten(int rankInten) {
		this.rankInten = rankInten;
	}

	public int getAudiCnt() {
		return audiCnt;
	}

	public void setAudiCnt(int audiCnt) {
		this.audiCnt = audiCnt;
	}

	public void setPosterURL(String posterURL) {
		this.posterURL = posterURL;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getCast() {
		return cast;
	}

	public void setCast(String cast) {
		this.cast = cast;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	public String getDisable() {
		return disable;
	}
	
	public void setDisable(String disable) {
		this.disable = disable;
	}
	
}

