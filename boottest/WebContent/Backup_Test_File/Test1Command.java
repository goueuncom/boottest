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


public class Test1Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	
		Vector a = new Vector();
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		pool = DBConnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			
			sql = "SELECT iname , count FROM tstock";
		    pstmt = con.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    while(rs.next()){
		    	StockDto dto = new StockDto();				
				dto.setName(rs.getString("iname"));
				dto.setCount(rs.getInt("count"));				
				a.add(dto);
			}
	
		
		int asize = a.size(); 
		

		} catch (Exception err) {
			err.printStackTrace();
			//System.out.println("addInput() : " + err);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("Ä¿¸Çµå");
		req.setAttribute("stockchart", a);
		
		
		return "Copy of test5678.jsp";
	}

}
