package semi;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SemiController extends HttpServlet {

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
		/*String cmd = req.getParameter("command");
		String url="";
		Command icmd = null;
		System.out.println(cmd);		
		if(cmd.equals("input")){
			icmd = new InputCommand();
		}
		else if(cmd.equals("output")){
			icmd = new OutputCommand();
		}
		else if(cmd.equals("final-sal-search")){
			icmd = new final_sal_searchCommand();
		}*/
		 
		String cmd = req.getParameter("command");
		//System.out.println("컨트롤러 "+req.getParameter("code"));

//		HttpSession session = req.getSession();
//		String current = (String)session.getAttribute("CURRENT_STATE");
		String url="";
			
		CommandFactory factory = CommandFactory.getInstance();		
		Command icmd = factory.createCommand(cmd);
		url = (String)icmd.processCommand(req, resp);
		
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
