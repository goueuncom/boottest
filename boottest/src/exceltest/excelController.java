package exceltest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class excelController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String cmd = req.getParameter("command");
		
		String url="";
			
		CommandFactory exFactory = CommandFactory.getInstance();		
		Command exIcmd = exFactory.createCommand(cmd);
		url = (String)exIcmd.processCommand(req, resp);
		
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
