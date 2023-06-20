package web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;

import dao.LostitemDao;
import dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import vo.Location;
import vo.Lostitem;
import vo.Member;
import vo.Theater;

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
@WebServlet(urlPatterns = "/center/lostitem/insert")
public class LostitemFileinsertServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션에서 로그인된 사용자 정보를 조회한다
		HttpSession session = request.getSession(); 
		String id = (String) session.getAttribute("loginId");

		MemberDao memberDao = MemberDao.getInstance();
		Member member = memberDao.getMemberById(id);
		
		if (member == null) {
			response.sendRedirect("/mgv/member/login/form.jsp?err=req&job="+URLEncoder.encode("문의글 등록", "utf-8"));
			return;
		}
		
		// 요청파라미터 조회
		// 일반 입력필드의 값 조회
		int locationNo = Integer.parseInt(request.getParameter("locationNo"));
		int theaterNo = Integer.parseInt(request.getParameter("theaterNo"));
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");                                            
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	      // 첨부파일 입력필드의 처리
	      Part upfilePart = request.getPart("upfile");
	      
	      String filename = null;
	      if (!upfilePart.getSubmittedFileName().isEmpty()) {
		      filename = System.currentTimeMillis() + upfilePart.getSubmittedFileName();  // 이름중복을 피하기 위해서 현재시간을 붙여준다.
		      
		      String projectPath = System.getenv("PROJECT_HOME");
		      String saveDirectory = projectPath + "/src/main/webapp/images/lostitem"; 
		      
		      InputStream in =  upfilePart.getInputStream();
		      OutputStream out = new FileOutputStream(new File(saveDirectory, filename));
		      IOUtils.copy(in, out);
	      }
	      
	   // 업무로직 수행
	    Lostitem lostitem = new Lostitem();
	  	lostitem.setLocation(new Location(locationNo));
	  	lostitem.setTheater(new Theater(theaterNo));
	  	lostitem.setTitle(title);
	  	lostitem.setContent(content);
	  	lostitem.setFileName(filename);
	  	
	  	member.setId(id);
	  	member.setName(name);
	  	member.setTel(tel);
	  	member.setEmail(email);
	  	lostitem.setMember(member);  
	  	
	  	// 업무로직 수행 - 새 분실물 문의글정보를 저장시킨다. 
		LostitemDao lostitemDao = LostitemDao.getInstance();
		lostitemDao.insertLostitem(lostitem);
		
		// 재요청URL 응답
		response.sendRedirect("list.jsp");
	}
}

















