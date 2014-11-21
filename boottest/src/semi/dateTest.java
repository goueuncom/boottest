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


public class dateTest implements Command {
	Vector vAddr = new Vector();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;
	String sql = null;
	

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String idate = req.getParameter("idate");
		String idate1 = req.getParameter("idate1");
		
		System.out.println("idate1 : " + idate +"idate2 : " + idate1 );

		pool = DBConnectionMgr.getInstance();
		try {
			con = pool.getConnection();

				String sql = "select name , sum(count) from toutput where odate >= ? and odate <= ? group by code";                        // sql 쿼리
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
				pstmt.setString(1,idate);
				pstmt.setString(2,idate1);
					
				
				
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
		return "select1.jsp";
	}

}
