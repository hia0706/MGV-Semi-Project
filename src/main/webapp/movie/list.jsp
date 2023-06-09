<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Movie"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.HashMap"%>
<%@page
	import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
/*
		프로세스는 크게 2가지 단계로 나뉨.
	1. 영진위로부터 전일 박스오피스 1위부터 10위까지 영화제목, 순위 가져와서 List<Movie> 객체에 담기
	2. 영진위로부터 받은 Movie객체들의 영화제목으로 kmdb에서 포스터, 출연진과같은 상세정보 담기 
	3. 이후 해당 데이터 사용

*/

// 1. 영진위 Api 접근및 파싱

	// 영진위에서 발급받은 개인 인증키 (개인고유키이기때문에 추후에 프로퍼티 파일을 만들고 해당파일 gitignore에 올리는 프로세스 작업 필요)
	String key = "45ac471b35ca42c983d971a438b31d25";
	// List객체생성
	List<Movie> movies = new ArrayList<>();
	
	//Api 접근 및 작업수행
	try {

		// 영진위에서 제공하는 오픈API 클라이언트 객체 생성(파라미터-인증키)
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
		// service객체로 영진위 서버로부터 전일 박스오피스 json 응답요청	
		String dailyResponse = service.getDailyBoxOffice(true, "20230608", "10", "", "", "");
		// json 응답을 처리하기위해 임포트한 json-simple 라이브러리의 내장객체인 jsonparser 객체생성 
		JSONParser jsonParser = new JSONParser();

		// 생성한 JsonParser객체로 응답받은 json 파일을 자바 object로 역직렬화	
		Object obj = jsonParser.parse(dailyResponse);
	
		//객체를 라이브러리에 맞게 활용하기위해 JSONObject 객체로 클래스형변환 
		JSONObject jsonObject = (JSONObject) obj;
	
		// 변환된 JSONObject 객체로부터 박스오피스정보 키에맞는 밸류 획득하여 새로운 객체에 대입  
		JSONObject parse_boxOfficeResult = (JSONObject) jsonObject.get("boxOfficeResult");
	
		// JSON객체를 Movie vo 리스트에 담기위해 JSON어레이 객체 생성
		JSONArray parse_dailyBoxOfficeList = (JSONArray) parse_boxOfficeResult.get("dailyBoxOfficeList");
	
		for (int i = 0; i < parse_dailyBoxOfficeList.size(); i++) {
			//JSON 어레이의 각 엘리먼트(각각의 영화) JSON객체 생성
			JSONObject dailyBoxOffice = (JSONObject) parse_dailyBoxOfficeList.get(i);
	
			//각 객체별로 담고있는 JSON 정보를 movie vo의 멤버변수의 값으로 대입
			Movie movie = new Movie();
			movie.setRank(Integer.parseInt((String) dailyBoxOffice.get("rank")));
			movie.setTitle((String) dailyBoxOffice.get("movieNm"));
			String tmp=(String) dailyBoxOffice.get("openDt");
			movie.setReleaseDate(tmp);
			movie.setAudiCnt(Integer.parseInt((String) dailyBoxOffice.get("audiAcc")));
			//Movie 리스트에 movie 담기
			movies.add(movie);
		}

	} catch (Exception e) {
		e.getMessage();
	}

// 2. KMDB로부터 영화 상세정보 채워넣기

	try{
		// 응답받은 JSON 파일을 담을 스트링 객체
		String kmdbApi;
		
		// 각 영화 하나당 상세정보 채우기 
		for (Movie movie : movies){
		
		//Api 요청할 요청 URL 생성(공통문자열)
		StringBuilder sb = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=Y40OV2CFS1I2MTV081VG");
		//api 요청 url 문 수정
		sb.append("&" + URLEncoder.encode("title","UTF-8") + "=" + URLEncoder.encode(movie.getTitle(), "UTF-8")); 
		sb.append("&" + URLEncoder.encode("releaseDts","UTF-8") + "=" + URLEncoder.encode(movie.getReleaseDate().replace("-",""), "UTF-8"));
		
		// 수정된 StringBuilder 멤버변수로 url객체생성
		URL url = new URL(sb.toString());
		// url 객체로 Http 코넥션 객체 획득
		HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
		
		// 커넥션 객체 요청방식 get방식으로 설정
		conn.setRequestMethod("GET");
		//커넥션 객체 요청프로퍼티 타입 json으로 설정
		conn.setRequestProperty("Content-type","application/json"); 
		
		// kmdb 서버로부터 데이터 전달받기위해 스트림 객체(버퍼드리더) 생성 
		BufferedReader rd; 
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
			} else { 
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream())); 
			}
		sb=new StringBuilder();
		
		// 버퍼드리더의 readLine메소드로 서버로부터 문자열 받아서 전부 kmdb 스트링빌더 객체에 추가
		while ((kmdbApi = rd.readLine()) != null) {
		    sb.append(kmdbApi);
		}
		// 이용끝난 자원 정리
		rd.close();
		conn.disconnect();
		
		//kmdb 스트링빌더 객체를 movieDetail 스트링 객체로 전환
		String movieDetail = sb.toString();
		
		// Json-simple 라이브러리의 JSONParser 객체 생성
		JSONParser jsonParser = new JSONParser();
		// 생성한 JsonParser객체로 응답받은 json 스트링 파일(movieDetail)을 자바 object로 역직렬화	
		Object obj = jsonParser.parse(movieDetail);
	
		//객체를 라이브러리에 맞게 활용하기위해 JSONObject 객체로 클래스형변환 
		JSONObject result = (JSONObject) obj;
		
		//이후 배열의 원소, 키의 값 순서대로 파싱하면서 원하는 값 찾아가기.
		JSONArray result1=(JSONArray) result.get("Data");
		result=(JSONObject) result1.get(0);
		result1=(JSONArray) result.get("Result");
		result=(JSONObject) result1.get(0);
		
		//포스터 URL들이 담긴 밸류 획득
		String posters=(String) result.get("posters");
		
		// 포스터 URL들 쪼개서 첫번째 포스터만 movie 객체의 posterURL 멤버변수로 설정
		String[] poster= posters.split("\\|");
		System.out.println(url);
		movie.setPosterURL(poster[0]);
		}
	} catch (Exception e) {
		e.getMessage();
	}


	// 관객수 콤마찍기위한 NumberFormat 상속객체
	DecimalFormat df = new DecimalFormat("###,###");

%>


<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp">
		<jsp:param name="menu" value="홈" />
	</jsp:include>



	<div>
		<h4 class="hidden">전일기준 박스오피스 순위</h4>

		<%
		for (Movie movie : movies) {
		%>
		<ul>
			<li>
				<div>
					<strong><%=movie.getRank()%></strong> <a href=""> <span
						class="thumb-image"> <img
							src="<%=movie.getPosterURL() %>">
					</span>
					</a>
				</div>

				<div class="box-contents">

					<a href=""> <strong class="title"><%=movie.getTitle()%></strong>
					</a>

					<div class="score">
						<strong class="percent">총 관객수 <span><%=df.format(movie.getAudiCnt()) %> 명</span></strong>
					</div>
					<span class="txt-info"> <strong>개봉일자 <%=movie.getReleaseDate() %>
					</strong>	
					</span>
				</div>
					<span class="txt-info"> <strong>예매가능여부 <%="Y".equals(movie.getReleaseDate()) ? "가능" :"불가능" %>

					</strong>	
					</span>
			</li>
		</ul>

		<%
		}
		%>
	</div>
</body>
</html>