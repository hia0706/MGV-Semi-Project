<%@page import="java.nio.file.Paths"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.HashSet"%>
<%@page import="service.SampleService"%>
<%@page import="vo.Movie"%>
<%@page import="java.util.List"%>
<%@page import="dao.ManagerMovieDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="java.io.*"%>

<%
 class Node {
    List<String> data;
    HashMap<Character,Node> childrens;
   public Node(){
    	 this.data = new ArrayList<>();
    	 this.childrens=new HashMap<>();
    }
}
class Trie{    
   char[] choSet = { 'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ',
    		'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' };
  char[] jungSet = { 'ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ',
    		'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ', 'ㅝ', 'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ',
    		'ㅣ' };
  char[] jongSet = {'\0', 'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ', 'ㄷ', 'ㄹ', 'ㄺ',
    		'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ', 'ㄿ', 'ㅀ', 'ㅁ', 'ㅂ', 'ㅄ', 'ㅅ',
    		'ㅆ', 'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' };
    
    
    public List<Character> getJamo(String inputWord){
    	List<Character> jamo=new ArrayList<>();
    	int l=inputWord.length();
    	for (int i=0; i<l; i++){
    		 int uniCode = (int)( inputWord.charAt(i)& 0xFFFF);
    		
    		 if (uniCode==32){
    			 jamo.add(' ');
    			 continue;
    		 }
    	     if (uniCode < 0xAC00 || uniCode > 0xD7A3) { 
    	        	jamo.add(inputWord.charAt(i));
    	        	continue; 
                    } 
    	     uniCode-=0xAC00; 
    	     
    	     
    	     int jong = uniCode % 28; 
             int jung = ((uniCode - jong) / 28 ) % 21; 
             int cho = (((uniCode - jong) / 28 ) - jung ) / 21 ;
    	     
             jamo.add(choSet[cho]);
             jamo.add( (char) (0xAC00+(cho*588)+(jung*28)) );
             if (jong != 0) { 
            	 jamo.add( (char) (0xAC00+(cho*588)+(jung*28)+(jong)) );	 
             }
    	}
    	return jamo;
    }
    public void getTrie(List<Movie> movies){
    	Node head=new Node();
    	String title;
    	Node currentNode;
    	HashMap<String, List<String>> map= new HashMap<>();
    	for (Movie movie : movies){
    		title=movie.getTitle();
    		List<Character> jamo=getJamo(title);
    		currentNode=head;
    		String key="";
    		for (char letter : jamo){
    			key+=letter;
    			if(!map.containsKey(key)){
    				List<String> words= new ArrayList<>();
    				map.put(key,words);
    			}
    			map.get(key).add(title);
    			HashMap<Character,Node> currentChildrens = currentNode.childrens;
    			Node currentChildren=null;
    			if (!currentChildrens.containsKey(letter)){
    				currentChildren=new Node();
    				currentChildrens.put(letter,currentChildren );
    			}
    			currentChildren = currentChildrens.get(letter);
    			currentChildren.data.add(title);
    			currentNode=currentChildren;
    		}
    		
    	}
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json=gson.toJson(map);
		
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter("C:/Users/Joon/Documents/MGV/src/main/webapp/admin/movie/trie.json"));
			bw.write("trie = ");
			bw.write(json);
			bw.flush();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
    return;   	
    }
   
    
    
}
 


%>

<%
/*
		업무로직 1줄 요약
		-> 영진위 차트의 영화들중 db에 없는 영화는 새로 인서트 하고, 있는 영화는 업데이트 한뒤,
			차트밖영화들 전부 업데이트
		
		1. 영진위, KMDB에서 전날 박스오피스 10위까지 영화의 데이터를 가져와서 List<Movie> 객체에 담은 후,
		2. 기존 DB저장된영화들을 다른 콜렉션에 담아두고,
		3. 1번의 차트영화들 로직수행하면서 DB저장된 리스트에서 하나씩 remove 해준다.
		4. 그 뒤 remove하고 남은 영화들의 필드(랭킹, 랭킹증감, 차트진입여부, 업데이트데이트) default 값으로 초기화한다.
			
*/


// 세션에서 로그인타입 속성획득
	String loginType = (String) session.getAttribute("loginType");

// 로그인타입 관리자아니면 로그인으로 리다이렉트시킴
	if (!"ADMIN".equals(loginType)){
		response.sendRedirect("../member/login.jsp");
		return;
	}
	
	ManagerMovieDao managerMovieDao= ManagerMovieDao.getInstance();
	SampleService service=SampleService.getInstance();
	List<Movie> movies= service.getMovies();
	
	HashSet<Integer> movieNos= 	managerMovieDao.getMovieNos();
	
	for (Movie movie: movies){
		if (movieNos.contains(movie.getNo())){
			managerMovieDao.updateMovie(movie);
			movieNos.remove(movie.getNo());
		}else {
			managerMovieDao.insertMovie(movie);
		}
	}
	
	for (int movieNo : movieNos){
		managerMovieDao.initChart(movieNo);
	}
	
	movies= service.getMovies();
	Trie trie=new Trie();
	trie.getTrie(movies);
	// 재요청URL 응답
	response.sendRedirect("list.jsp");
%>