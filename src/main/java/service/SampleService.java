package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import util.DateUtils;
import vo.Movie;

public class SampleService {
	private static SampleService instance = new SampleService();
	private SampleService() {}
	public static SampleService getInstance() {
		return instance;
	}
	
	
    private static final String API_KEY = "45ac471b35ca42c983d971a438b31d25";
    private static final String API_URL = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=Y40OV2CFS1I2MTV081VG";
    private static final JSONParser JSON_PARSER = new JSONParser();

    public List<Movie> getMovies() {

        List<Movie> movies = new ArrayList<Movie>();

        try {
            KobisOpenAPIRestService service = new KobisOpenAPIRestService(API_KEY);
            String yesterday = LocalDate.now().minus(1, ChronoUnit.DAYS).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
            String dailyResponse = service.getDailyBoxOffice(true, yesterday, "10", "", "", "");
            JSONObject jsonObject = (JSONObject) JSON_PARSER.parse(dailyResponse);
            JSONObject parseBoxOfficeResult = (JSONObject) jsonObject.get("boxOfficeResult");
            JSONArray parseDailyBoxOfficeList = (JSONArray) parseBoxOfficeResult.get("dailyBoxOfficeList");

            for (Object dailyBoxOfficeObj : parseDailyBoxOfficeList) {
                JSONObject dailyBoxOffice = (JSONObject) dailyBoxOfficeObj;
                Movie movie = new Movie();
                movie.setRank(Integer.parseInt((String) dailyBoxOffice.get("rank")));
                movie.setTitle((String) dailyBoxOffice.get("movieNm"));
                String stringDate= dailyBoxOffice.get("openDt").toString();
                if (!stringDate.isBlank() && !stringDate.isEmpty()) {
                	movie.setReleaseDate(DateUtils.toDate(stringDate));
                }
                movie.setAudiCnt(Integer.parseInt((String) dailyBoxOffice.get("audiAcc")));
                movie.setNo(Integer.parseInt((String) dailyBoxOffice.get("movieCd")));
                movie.setRankInten(Integer.parseInt((String) dailyBoxOffice.get("rankInten")));
                movie.setRankOldAndNew((String) dailyBoxOffice.get("rankOldAndNew"));
                movies.add(movie);
            }

            for (Movie movie : movies) {
            	String movieTitle=movie.getTitle();
            		movieTitle=movieTitle.replace("무삭제","");
                String apiUrl = String.format(
                		"%s&title=%s&releaseDts=%s", 
                		API_URL, 
                		URLEncoder.encode(movieTitle, "UTF-8"), 
                		URLEncoder.encode(DateUtils.toText(movie.getReleaseDate()).replace("-",""), "UTF-8")
        		);
                
                URL url = new URL(apiUrl);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");
                BufferedReader rd;
                if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                } else {
                    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                }

                StringBuilder sb = new StringBuilder();
                String kmdbApi;
                while ((kmdbApi = rd.readLine()) != null) {
                    sb.append(kmdbApi);
                }
                rd.close();
                conn.disconnect();
                	
                String movieDetail = sb.toString();
                Object obj = JSON_PARSER.parse(movieDetail);
                JSONObject result = (JSONObject) obj;
                JSONArray result1 = (JSONArray) result.get("Data");
                result = (JSONObject) result1.get(0);
                result1 = (JSONArray) result.get("Result");
                result = (JSONObject) result1.get(0);
                String posters = (String) result.get("posters");
                String[] poster = posters.split("\\|");
                sb= new StringBuilder();
                for (int i=0; i<(poster.length<4? poster.length : 3); i++) {
                	sb.append(poster[i]+" ");
                }
                posters=sb.toString();
                JSONObject directorResult = (JSONObject)result.get("directors");
                JSONArray directorResultArray = (JSONArray)directorResult.get("director");
                directorResult=(JSONObject)directorResultArray.get(0);
                String directorName=(String)directorResult.get("directorNm");
                
                
                JSONObject descriptionResult = (JSONObject)result.get("plots");
                JSONArray descriptionResultArray = (JSONArray)descriptionResult.get("plot");
                descriptionResult=(JSONObject)descriptionResultArray.get(0);
                String description=(String)descriptionResult.get("plotText");
               
                JSONObject actor = (JSONObject)result.get("actors");
                JSONArray actorArray = (JSONArray)actor.get("actor");
                sb=new StringBuilder();
                int actorIndex=0;
                for (actorIndex=0; actorIndex< (actorArray.size()<3 ? actorArray.size()-1 : 2); actorIndex++ ) {
                	actor= (JSONObject)actorArray.get(actorIndex);
                	sb.append((String)actor.get("actorNm")+", ");
                }
                actor= (JSONObject)actorArray.get(actorIndex);
            	sb.append((String)actor.get("actorNm"));
            	String cast=sb.toString();
            	
            	
                movie.setPosterURL(posters);
                movie.setGenre((String)result.get("genre"));
                movie.setDirector(directorName);
                movie.setDescription(description);
                movie.setCast(cast);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return movies;
    }

}
