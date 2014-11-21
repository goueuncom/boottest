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


public class Input_all_searchCommand implements Command {
	Vector vAddr = new Vector();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;
	String sql = null;
	

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String sort = req.getParameter("code");
		System.out.println("sort : "+req.getParameter("code"));

		pool = DBConnectionMgr.getInstance();
		try {
			con = pool.getConnection();

			sql = "select * from tinput order by "+sort;
			pstmt = con.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			System.out.println(sql);
			while (rs.next()) {
				StockDto stockdto = new StockDto();
				stockdto.setCode(rs.getInt("code"));
				stockdto.setName(rs.getString("name"));
				stockdto.setCount(rs.getInt("count"));
				stockdto.setIdate(rs.getString("idate"));
				vAddr.add(stockdto);
			}

		} catch (Exception err) {
			err.printStackTrace();
			//System.out.println("addInput() : " + err);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("ialls", vAddr);
		return "input-all-search.jsp";
	}

}
