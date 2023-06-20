<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.io.FileReader"%>
<%@page import="com.google.gson.JsonParser"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%
 
 class Trie{    
	  char[] choSet = { 'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ',
	    		'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' };
	 char[] jungSet = { 'ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ',
	    		'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ', 'ㅝ', 'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ',
	    		'ㅣ' };
	 char[] jongSet = {'\0', 'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ', 'ㄷ', 'ㄹ', 'ㄺ',
	    		'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ', 'ㄿ', 'ㅀ', 'ㅁ', 'ㅂ', 'ㅄ', 'ㅅ',
	    		'ㅆ', 'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' };
	    
	    
	    public String getJamo(String inputWord){
			StringBuilder sb= new StringBuilder();	    	
	    	int l=inputWord.length();
	    	for (int i=0; i<l; i++){
	    		 int uniCode = (int)( inputWord.charAt(i)& 0xFFFF);
	    		
	    		 if (uniCode==32){
	    			 sb.append(' ');
	    			 continue;
	    		 }
	    	     if (uniCode < 0xAC00 || uniCode > 0xD7A3) { 
	    	        	sb.append(inputWord.charAt(i));
	    	        	continue; 
	                    } 
	    	     uniCode-=0xAC00; 
	    	     
	    	     
	    	     int jong = uniCode % 28; 
	             int jung = ((uniCode - jong) / 28 ) % 21; 
	             int cho = (((uniCode - jong) / 28 ) - jung ) / 21 ;
	    	     
	             sb.append(choSet[cho]);
	             sb.append( (char) (0xAC00+(cho*588)+(jung*28)) );
	             if (jong != 0) { 
	            	 sb.append( (char) (0xAC00+(cho*588)+(jung*28)+(jong)) );	 
	             }
	    	}
	    	return sb.toString();
	    }
 }
 %>
 
 
 <%
 JsonParser parser = new JsonParser();
 String jsonFilePath = "C:/Workspace/movie-open-api/trie.json";
 Object obj = parser.parse(new FileReader(jsonFilePath));
 JsonObject jsonObject =(JsonObject) obj;
 String searchWord = request.getParameter("searchWord");
 Trie trie= new Trie();
 JsonArray jsonArray=null;
 if (searchWord!=null){
 String x= trie.getJamo(searchWord);
jsonArray = (JsonArray) jsonObject.get(x);
 }
 %>
<%=jsonArray %>	