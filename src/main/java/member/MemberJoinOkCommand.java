package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" :  request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" :  request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" :  request.getParameter("name");
		String birthday = request.getParameter("birthday")==null ? "" :  request.getParameter("birthday");
		String nickName = request.getParameter("nickName")==null ? "" :  request.getParameter("nickName");
		
		
		MemberDAO dao = new MemberDAO();
		
		String res = "0";
				
		res = dao.getMemberMidCheck(mid);
		if(res == "1") {
			request.setAttribute("msg", "이미 사용중인 아이디입니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberJoin.mem");
			return;
		}
		
		res = dao.getMemberNickCheck(nickName);
		if(res == "1") {
			request.setAttribute("msg", "이미 사용중인 닉네임입니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberJoin.mem");
			return;
		}
		
		
		MemberVO vo = null;
		
		UUID uid = UUID.randomUUID();
		String salt = uid.toString().substring(0,8);
		pwd = salt + pwd;
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setNickName(nickName);
		vo.setBirthday(birthday);
		
		int res1 = dao.setMemberJoinOk(vo);
		
		if(res1 == 1) {
			request.setAttribute("msg", "회원에 가입되셨습니다. \\n다시 로그인해 주세요.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
		}
		else {
			request.setAttribute("msg", "회원가입 실패~~");
			request.setAttribute("url", request.getContextPath()+"/MemberJoin.mem");
		}
	}
}







