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


public class final_sal_search1Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		StockDto stockdto = new StockDto();
		Vector vAddr = new Vector();
		
		if(req.getParameter("pcode") == null){
			return "final-sal-search.jsp";
		}
		
		else if(stockdto.getPcode() != 0){
		stockdto.setPcode(Integer.parseInt(req.getParameter("pcode")));
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		pool = DBConnectionMgr.getInstance();
		try {
			con = pool.getConnection();

			sql = "select psa,pname,p.pdes,p.pnum from plist p , psal s where p.pdes = s.pdes and p.pnum = s.pnum and pcode = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stockdto.getPcode());
			rs = pstmt.executeQuery();
			if(rs.next());
			int psa = rs.getInt("psa");
			stockdto.setPname(rs.getString("pname"));
			stockdto.setPdes(rs.getInt("p.pdes"));
			stockdto.setPnum(rs.getInt("p.pnum"));
			
			sql = "select posname from pposit where pnum = ?"; // sql Äõ¸®
			pstmt = con.prepareStatement(sql); 												
			pstmt.setInt(1, stockdto.getPnum());
			rs = pstmt.executeQuery();
			if(rs.next());			
			stockdto.setPosname(rs.getString("posname"));
			
			sql = "select unpaid , late from patt where pcode = ?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, stockdto.getPcode());
			rs = pstmt.executeQuery();  
			if(rs.next());			
			int unpaid = rs.getInt("unpaid");
			int late = rs.getInt("late");
			
			if(unpaid != 0){
				psa = psa - (unpaid * 50000);
			}
			
			if(late != 0){
				psa = psa - (late * 5000);
			}
			
			stockdto.setPsa(psa);
			stockdto.setUnpaid(unpaid);
			stockdto.setLate(late);
			vAddr.add(stockdto);
		} catch (Exception err) {
			err.printStackTrace();
			//System.out.println("addInput() : " + err);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
		req.setAttribute("final", vAddr);
		return "Chart_test_final-sal-search.jsp";
	}

}
