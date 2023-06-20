package web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;

import dao.MemberDao;
import dao.TheaterBoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import vo.Location;
import vo.Member;
import vo.Theater;
import vo.TheaterBoard;

/*
 * @MultipartConfig
 * 	- 서블릿이 enctype="mulipart/form-data"요청을 처리하도록 지원한다.
 *  - 주요속성값
 *  	fileSizeThreshold - 파일 업로드 시에 메모리에 저장되느 임시 파일 크기 지정
 *  					    지정한 크기를 넘어서면 실제로 임시파일로저장된다.
 *  	maxFileSize - 업로드할 파일의 최대 크기 지정
 *  	maxRuquestSize - 요청시의 최대 크기 지정
 *  	location - 파일 업로드시에 임시저장 디렉토리 지정
 */

@MultipartConfig(
		fileSizeThreshold =  1024*1024*10,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*100)
@WebServlet(urlPatterns = "/board/theater/insert")
public class TheaterBoardFileinsertServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션에서 로그인된 사용자 정보를 조회한다
		HttpSession session = request.getSession(); 
		String loginId = (String) session.getAttribute("loginId");

		if(loginId == null){
			response.sendRedirect("../../member/login/form.jsp?err=req&job=" + URLEncoder.encode("게시물등록", "utf-8"));
			return;
		}
		
		// 요청파라미터 조회
		// 일반 입력필드의 값 조회
		String name = request.getParameter("name");
		int locationNo = Integer.parseInt(request.getParameter("locationNo"));
		int theaterNo = Integer.parseInt(request.getParameter("theaterNo"));
		String content = request.getParameter("content");
		String grade = request.getParameter("grade");
		
	      // 첨부파일 입력필드의 처리
	      Part upfilePart = request.getPart("upfile");
	      
	      String filename = null;
	      if (!upfilePart.getSubmittedFileName().isEmpty()) {
		      filename = System.currentTimeMillis() + upfilePart.getSubmittedFileName();  // 이름중복을 피하기 위해서 현재시간을 붙여준다.
		      
		      String projectPath = System.getenv("PROJECT_HOME");
		      String saveDirectory = projectPath + "/src/main/webapp/images/board/theater"; 
		      
		      InputStream in =  upfilePart.getInputStream();
		      OutputStream out = new FileOutputStream(new File(saveDirectory, filename));
		      IOUtils.copy(in, out);
	      }
	      
	   // 업무로직 수행
	  	TheaterBoard theaterBoard = new TheaterBoard();
		theaterBoard.setName(name);
		theaterBoard.setContent(content);
		theaterBoard.setGrade(grade);
		theaterBoard.setFileName(filename);
		
		Location location = new Location();
		location.setNo(locationNo);
		theaterBoard.setLocation(location);
		
		Theater theater = new Theater();
		theater.setNo(theaterNo);
		theaterBoard.setTheater(theater);
		
		Member member = new Member();
		member.setId(loginId);
		theaterBoard.setMember(member);
		
		TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
		theaterBoardDao.insertTheaterBoard(theaterBoard);
		
		response.sendRedirect("list.jsp");
	  	
	}
}