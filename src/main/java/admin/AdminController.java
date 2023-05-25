package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardContentCommand;
import board.BoardInterface;

@SuppressWarnings("serial")
@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AeminInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(level > 1) {	
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}	
		else if(com.equals("/AdminMyPage")) {
			viewPage += "/adminMyPage.jsp";
		}
		else if(com.equals("/AdminLeft")) {
			viewPage += "/adminLeft.jsp";
		}
		else if(com.equals("/AdminContent")) {
			command = new AdminContentCommand();
			command.execute(request, response);
			viewPage += "/adminContent.jsp";
		}
		else if(com.equals("/AdminLogin")) {
			command = new AdminLoginCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AdminLogout")) {
			command = new AdminLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AdminGuest")) {
			command = new AdminGuestListCommand();
			command.execute(request, response);
			viewPage += "/adminGuest.jsp";
		}
		else if(com.equals("/AdminGuestList")) {
			command = new AdminGuestListCommand();
			command.execute(request, response);
			viewPage += "/member/adminGuestList.jsp";
		}
		else if(com.equals("/AminGuestTool")) {
			command = new AdminGuestToolCommand();
			command.execute(request, response);
			viewPage += "/member/adminGuestTool.jsp";
		}
		else if(com.equals("/AdminGuestShow")) {
			command = new AdminGuestShowCommand();
			command.execute(request, response);
			viewPage += "/member/adminGuestTool.jsp";
		}
		else if(com.equals("/AdminGuestDelete")) {
			command = new AdminGuestDeleteCommand();
			command.execute(request, response);
			return;
		}
		
		else if(com.equals("/AdminBoard")) {
			command = new AdminBoardCommand();
			command.execute(request, response);
			viewPage += "/adminBoard.jsp";
		}
		else if(com.equals("/AdminBoardList")) {
			command = new AdminBoardListCommand();
			command.execute(request, response);
			viewPage += "/member/adminBoardList.jsp";
		}
		else if(com.equals("/AdminBoardTool")) {
			command = new AdminBoardToolCommand();
			command.execute(request, response);
			viewPage += "/member/adminBoardTool.jsp";
		}
		else if(com.equals("/AdminMemberInfor")) {
			command = new AdminMemberInforCommand();
			command.execute(request, response);
			viewPage += "/member/adminMemberInfor.jsp";
		}
		else if(com.equals("/AdminBoardInput")) {
			viewPage += "/member/adminBoardInput.jsp";
		}
		else if(com.equals("/AdminBoardContent")) {
			command = new AdminBoardContentCommand();
			command.execute(request, response);
			viewPage += "/member/adminBoardContent.jsp";
		}
		else if(com.equals("/AdminBoardDelete")) {
			command = new AdminBoardDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AdminBoardToolShow")) {
			command = new AdminBoardToolShowCommand();
			command.execute(request, response);
			viewPage += "/member/adminBoardTool.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
