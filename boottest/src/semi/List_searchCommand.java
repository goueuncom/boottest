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


public class List_searchCommand implements Command {
	Vector vAddr = new Vector();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;
	String sql = null;
	

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String code = req.getParameter("code");
		

		pool = DBConnectionMgr.getInstance();
		try {
			con = pool.getConnection();

			if(code != ""){
				String sql = "select * from tlist where code = ?";                        // sql 쿼리
				pstmt = con.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
				pstmt.setString(1,code);
				}
				if(code == ""){
					String sql1 = "select * from tlist order by code";                        // sql 쿼리
					pstmt = con.prepareStatement(sql1);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
					
				}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				StockDto stockdto = new StockDto();
				stockdto.setCode(rs.getInt("code"));
				stockdto.setName(rs.getString("iname"));
				stockdto.setCname(rs.getString("cname"));
				stockdto.setPrice(rs.getInt("price"));
				stockdto.setSprice(rs.getInt("sprice"));
				stockdto.setDes(rs.getInt("des"));				
				vAddr.add(stockdto);
			}

		} catch (Exception err) {
			err.printStackTrace();
			//System.out.println("addInput() : " + err);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("List", vAddr);
		return "list-search.jsp";
	}

}
