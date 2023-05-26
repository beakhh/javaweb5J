package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

public class AdminMemberLevelTotalChangeCommand implements AeminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = request.getParameter("level")==null ? 0 : Integer.parseInt(request.getParameter("level"));
		String changeItem = request.getParameter("changeItems")==null ? "" : request.getParameter("changeItems");
		
		System.out.println(level);
		System.out.println(changeItem);
		String[] changeItems = changeItem.split("/");
		
		MemberDAO dao = new MemberDAO();
		
		for(String item : changeItems) {
			dao.setMemberLevelChange(level, Integer.parseInt(item));
		}
	}
}
