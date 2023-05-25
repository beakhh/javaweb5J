package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class AdminBoardToolShowCommand implements AeminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 1 : Integer.parseInt(request.getParameter("pageSize"));
		
		int part = request.getParameter("part")==null ? 0 :Integer.parseInt(request.getParameter("part"));
		int showNum = request.getParameter("showNum")==null ? 0 :Integer.parseInt(request.getParameter("showNum"));
		
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardVO> vos = null;
		
		int totRecCnt = dao.getTotRecCnt();
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1 ;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// 블록페이징처리....
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		vos = dao.getBoardPartCheck(part,showNum);
		
		request.setAttribute("pag", pag);
		request.setAttribute("vos", vos);
		request.setAttribute("part", part);
		request.setAttribute("showNum", showNum);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}
}
