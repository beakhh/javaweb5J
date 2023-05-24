package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;
import member.MemberDAO;
import member.MemberVO;

public class AdminLoginCommand implements AeminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		if(!vo.getMid().equals("admin") || vo.getLevel() > 2) {
			request.setAttribute("msg", "로그인 권한이 없습니다. ");
			request.setAttribute("url", request.getContextPath()+"/");
			return;
		}
		
		String salt = vo.getSalt();
		pwd = salt + pwd;
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		
		String res = dao.getGuestPwdCheck(mid,pwd);
		
		if(res == "1") {
			HttpSession session = request.getSession();
			session.setAttribute("sAdmin", mid);
			
			request.setAttribute("msg", "관리자 인증 성공!!!");
			request.setAttribute("url", request.getContextPath()+"/AdminMyPage.admin");
		}
		else {
			request.setAttribute("msg", "관리자 인증 실패~~");
			request.setAttribute("url", request.getContextPath()+"/");
		}
	}

}
