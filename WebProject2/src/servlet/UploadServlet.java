package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext application = getServletContext();	//중X
		String path = application.getRealPath("upload"); //파일이 저장될 폴더
		System.out.println("절대 경로real path : " + path);
		
		//"upload" 폴더가 없으면, 만들기
		File filePath = new File(path);
		if(!filePath.exists()) {
			filePath.mkdirs();
		}
		
		int fileLimit = 100 * 1024 * 1024;	//100메가 바이트 /파일 크기 제한설정
		MultipartRequest multi = new MultipartRequest(
				request, //요청객체
				path, 	// 파일 저장경로(절대경로)
				fileLimit, //파일 최대크기
				"UTF-8", //ㅣ파일한글깨짐방지
				new DefaultFileRenamePolicy()	// 기본적인 'rename' 정책
			); //---> MultipartRequest 객체가 생성될때!! 파일로 저장완료
			// 저장된 파일에 대한 정보(파일 이름)를 MultipartRequest 객체로부터 뽑아냄
			Enumeration<?> files = multi.getFileNames();	//파일을 여러개 가져올수 있게 하기 위해서
			String fileObject = (String)files.nextElement();
			String filename = multi.getFilesystemName(fileObject); //서버에 저장된 파일 이름
			//[참고]  multi.getOriginalFileName(fileObject) //웹브라우저에서 선탣한 파일이름
			//multi.getOriginalFileName(fileObject)	//업로드한 파일크기(바이트단위)
			
			
			String description = multi.getParameter("desc");
			//[주의] Not "request.getParameter..."
			
			
			request.setAttribute("desc", description);	//문자열
			request.setAttribute("filename", filename);
			request.getRequestDispatcher("ExUploadResult.jsp").forward(request,response);
			
			
	}

}
