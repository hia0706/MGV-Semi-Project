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
@WebServlet(urlPatterns = "/board/theater/modify")
public class TheaterBoardFilemodifyServlet extends HttpServlet {
	
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
		int boardNo = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		int locationNo = Integer.parseInt(request.getParameter("locationNo"));
		int theaterNo = Integer.parseInt(request.getParameter("theaterNo"));
		String content = request.getParameter("content");
		
	      // 첨부파일 입력필드의 처리
	      Part upfilePart = request.getPart("upfile");
	      
			String fileName = null;
			if (!upfilePart.getSubmittedFileName().isEmpty()) {
				fileName = System.currentTimeMillis() + upfilePart.getSubmittedFileName();
		      
		      String projectPath = System.getenv("PROJECT_HOME");
		      String saveDirectory = projectPath + "/src/main/webapp/images/board/theater"; 
		      
		      InputStream in =  upfilePart.getInputStream();
		      OutputStream out = new FileOutputStream(new File(saveDirectory, fileName));
		      IOUtils.copy(in, out);
	      }

	   // 업무로직 수행
	  	TheaterBoardDao theaterBoardDao = TheaterBoardDao.getInstance();
		TheaterBoard savedTheaterBoard = theaterBoardDao.getTheaterBoardByNo(boardNo);
		if (!savedTheaterBoard.getMember().getId().equals(loginId)){
			response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id&job="+URLEncoder.encode("수정", "utf-8"));
			// 게시물을 작성한 사용자가 맞으면 게시물 수정을 진행한다.
		} else if (savedTheaterBoard.getMember().getId().equals(loginId)) {
		
			// 요청 파라미터로 받은 수정 정보를 담는다.
			savedTheaterBoard.setName(name);
			savedTheaterBoard.setContent(content);
			
			Location location = new Location();
			location.setNo(locationNo);
			savedTheaterBoard.setLocation(location);
			
			Theater theater = new Theater();
			theater.setNo(theaterNo);
			savedTheaterBoard.setTheater(theater);
			
			Member member = new Member();
			member.setId(loginId);
			savedTheaterBoard.setMember(member);
			savedTheaterBoard.setFileName(fileName);
			
			// 수정된 게시물 정보를 담은 게시물 정보를 DB에 UPDATE 한다.
			theaterBoardDao.updateTheaterBoardFile(savedTheaterBoard);
			
			// URL 재요청
			response.sendRedirect("detail.jsp?no="+boardNo);
			}
	  	
	}
}