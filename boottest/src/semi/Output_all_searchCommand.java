package semi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Output_all_searchCommand implements Command {
	Vector v_output_all_search = new Vector();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;
	String sql = null;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String sort = req.getParameter("code");
		
		pool = DBConnectionMgr.getInstance();
		try {
			con = pool.getConnection();

			sql = "select * from toutput order by "+sort;
			pstmt = con.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			//System.out.println(sql);
			while (rs.next()) {
				StockDto stockdto = new StockDto();
				stockdto.setCode(rs.getInt("code"));
				stockdto.setName(rs.getString("name"));
				stockdto.setCount(rs.getInt("count"));
				stockdto.setOdate(rs.getString("odate"));
				v_output_all_search.add(stockdto);
			}

		} catch (Exception err) {
			System.out.println("Output_all_searchCommand : "+err);

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("v_output_all_search", v_output_all_search);
		return "output-all-search.jsp";
	}
}
