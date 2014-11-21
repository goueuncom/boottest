package semi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sal_searchCommand implements Command {
	ResultSet rs = null;
	Connection conn = null; // null로 초기화 한다.
	PreparedStatement pstmt = null;
	DBConnectionMgr pool = null;
	StockDto dto = new StockDto();
	String sql = null;
	int pdes = 0, pnum = 0;
	Vector vAddr = new Vector();
	Vector vAddr1 = new Vector();
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();

			 dto.setPcode(Integer.parseInt(req.getParameter("code")));
			//String pcode = req.getParameter("code");
			sql = "select phdate,psa,pname,p.pdes,p.pnum from plist p , psal s where p.pdes = s.pdes and p.pnum = s.pnum and pcode = ?"; // sql
			pstmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리
			pstmt.setInt(1, dto.getPcode());
			rs = pstmt.executeQuery();
			System.out.println(sql);
			
			rs.next();
			dto.setPhdate(rs.getString("phdate"));
			dto.setPsa(rs.getInt("psa"));
			dto.setPname(rs.getString("pname"));
			dto.setPdes(rs.getInt("p.pdes"));
			dto.setPnum(rs.getInt("p.pnum"));
			
			// dto.setPnum(rs.getInt("pnum"));
			System.out.println("command" +dto.getPnum());
			System.out.println("검색");

			sql = "select posname from pposit where pnum = ?"; // sql 쿼리
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, dto.getPnum());
				
			rs = pstmt.executeQuery();

			rs.next();
			dto.setPosname(rs.getString("posname"));
			vAddr.add(dto);
			System.out.println("검색");
			System.out.println(dto.getPsa()); 
			
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		req.setAttribute("sal", vAddr);
		
		return "sal-search.jsp";
	}

}
