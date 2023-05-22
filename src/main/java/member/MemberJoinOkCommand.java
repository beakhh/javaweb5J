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
		String nickName = request.getParameter("nickName")==null ? "" :  request.getParameter("nickName");
		String gender = request.getParameter("gender")==null ? "" :  request.getParameter("gender");
		String birthday = request.getParameter("birthday")==null ? "" :  request.getParameter("birthday");
		
		
		MemberDAO dao = new MemberDAO();
		
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
		vo.setBirthday(gender);
		vo.setBirthday(birthday);
		vo.setSalt(salt);
		
		int res1 = dao.setMemberJoinOk(vo);
		System.out.println(res1);
		if(res1 == 1) {
			request.setAttribute("msg", "회원에 가입되셨습니다. \\n다시 로그인해 주세요.");
			request.setAttribute("url", request.getContextPath()+"/MemberJoin.mem");
		}
		else {
			request.setAttribute("msg", "회원가입 실패 다시 시도해 주세요~~");
			request.setAttribute("url", request.getContextPath()+"/MemberJoin.mem");
		}
	}
}







