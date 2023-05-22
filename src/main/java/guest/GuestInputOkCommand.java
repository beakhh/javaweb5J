package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GuestInputOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
	
		HttpSession session = request.getSession();
		int level = (int) session.getAttribute("sLevel");
		
		name = name.replace("<", "&lt;");
		name = name.replace(">", "&gt;");
		
		GuestVO vo = new GuestVO();
		
		vo.setName(name);
		vo.setName(mid);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		GuestDAO dao = new GuestDAO();
		
		int res = dao.setGuestInputOk(vo);
		
		if(res == 1) {
			if(level == 4 && mid != null) {
				GuestCountVO vo1 = new GuestCountVO();
				vo1 = dao.getCountSerch(mid);
				
				if(vo1.getMid() == null) {
					dao.setgCountInsert(mid);
				}
				dao.setgCountUpdate(mid);
			}
			
			request.setAttribute("msg", "방명록에 글이 등록되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/GuestList.gu");
		}
		else {
			request.setAttribute("msg", "방문소감 등록 실패~~");
			request.setAttribute("url", request.getContextPath()+"/GuestInput.gu");
		}
	}

}