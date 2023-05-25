package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.GuestDAO;

public class AdminGuestDeleteCommand implements AeminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String changeItem = request.getParameter("changeItems")==null ? "" : request.getParameter("changeItems");
		
		String[] changeItems = changeItem.split("/");
		
		GuestDAO dao = new GuestDAO();
		
		for(String idx : changeItems) {
			dao.setGuestDelete(Integer.parseInt(idx));
		}
		
	}

}
