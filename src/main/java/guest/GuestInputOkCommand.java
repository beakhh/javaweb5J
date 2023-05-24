package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;

public class GuestInputOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
	
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 6 :  (int) session.getAttribute("sLevel") ;
		String mid = session.getAttribute("sMid")==null ? "" :  (String) session.getAttribute("sMid") ;
		
		name = name.replace("<", "&lt;");
		name = name.replace(">", "&gt;");
		
		GuestVO vo = new GuestVO();
		
		
		vo.setName(name);
		vo.setMid(mid);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		
		GuestDAO dao = new GuestDAO();
		
		int res = dao.setGuestInputOk(vo);
		
		if(res == 1) {
			
			if(level == 4 && mid.equals(vo.getMid())) {
				GuestCountVO vo1 = new GuestCountVO();
				vo1 = dao.getCountSerch(mid);
				
				if(vo1.getMid() == null) {
					dao.setgCountInsert(mid);
				}
				dao.setgCountUpdate(mid);
				
				MemberDAO dao1 = new MemberDAO();
				MemberVO vo2 = dao1.getMemberMidCheck(mid);
				
				if(vo2.getLevel() == 4 && vo2.getVisitCnt() >= 10) {
					vo1 = dao.getCountSerch(mid);
					
					if(vo1.getCount() >= 5) {
						dao1.setgCountUpdateLevel(mid);
						dao.setDeleteData(mid);
						
						/*
						 *  로그아웃 시키고 싶어
						 */
						
						
					}
				}
				request.setAttribute("msg", mid +"방명록에 글이 등록되었습니다.");
				request.setAttribute("url", request.getContextPath()+"/GuestList.gu");
			}
			else {
				request.setAttribute("msg", mid +"방명록에 글이 등록되었습니다.");
				request.setAttribute("url", request.getContextPath()+"/GuestList.gu");
			}
		}
		else {
			request.setAttribute("msg", "방문소감 등록 실패~~");
			request.setAttribute("url", request.getContextPath()+"/GuestInput.gu");
		}
	}

}