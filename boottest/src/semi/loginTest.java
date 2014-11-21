package semi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginTest implements Command {
	Connection con =null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DBConnectionMgr pool=null;
	String sql = null;
	int pnum;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		res.setCharacterEncoding("euc-kr");
		
		HttpSession session = req.getSession();
		
		String pcode = req.getParameter("pcode");		
		System.out.println("pcode : "+pcode);
		
		try{  
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
				sql = "select pnum from plist where pcode = ?";				
				pstmt = con.prepareStatement(sql);             
				pstmt.setString(1,pcode);
				rs = pstmt.executeQuery();
				rs.next();					
				pnum = rs.getInt("pnum");
						
				session.setAttribute("login", pnum);
				
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
	if(pnum == 3){
		return "Master.jsp";
	}
	else{
		return "User.html";
	}
	
	
	}
}
