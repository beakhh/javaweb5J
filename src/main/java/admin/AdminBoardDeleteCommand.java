package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import guest.GuestDAO;

public class AdminBoardDeleteCommand implements AeminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String changeItem = request.getParameter("changeItems")==null ? "" : request.getParameter("changeItems");
		
		String[] changeItems = changeItem.split("/");
		
		BoardDAO dao = new BoardDAO();
		
		for(String idx : changeItems) {
			dao.setBoardDelete(Integer.parseInt(idx));
		}
		
	}

}
