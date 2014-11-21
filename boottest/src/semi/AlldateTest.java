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


public class AlldateTest implements Command {
	Vector vAddr = new Vector();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;
	String sql = null;
	

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		pool = DBConnectionMgr.getInstance();
		try {
			con = pool.getConnection();

				String sql = "select name , sum(count) from toutput group by code";                        // sql Äõ¸®
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);				
			
				
				
			rs = pstmt.executeQuery();
			while (rs.next()) {
				StockDto stockdto = new StockDto();
				stockdto.setName(rs.getString("name"));
				stockdto.setCount(rs.getInt("sum(count)"));				
				vAddr.add(stockdto);
			}

		} catch (Exception err) {
			err.printStackTrace();
			//System.out.println("addInput() : " + err);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("date", vAddr);
		return "AlldateTest.jsp";
	}

}
