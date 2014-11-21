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


public class TestCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		String code = req.getParameter("code");
		Vector a = new Vector();
		Vector b = new Vector();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		pool = DBConnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			
			sql = "SELECT name, sum(count) FROM tinput GROUP BY code";
		    pstmt = con.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    while(rs.next()){
		    	StockDto dto = new StockDto();				
				dto.setName(rs.getString("name"));
				dto.setAll_I_Count(rs.getInt("sum(count)"));
				System.out.println("입고"+dto.getAll_I_Count());
				a.add(dto);
			}
			
			sql = "SELECT sum(count) FROM toutput GROUP BY code";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				StockDto dto = new StockDto();
				dto.setAll_O_Count(rs.getInt("sum(count)"));
				System.out.println("출고"+dto.getAll_O_Count());
				b.add(dto);
			}
		
		int asize = a.size(); 
		int bsize = b.size(); 
		int an = asize-bsize;
		System.out.println(an);
		if(an != 0){
		for(int i=0;i<an;i++){
			StockDto dto = new StockDto();
			dto.setAll_O_Count(0);
			b.add(dto);
			}
		}
		
		for(int i=0;i<5;i++){
			StockDto dto = new StockDto();
			System.out.println(dto.getAll_O_Count());
		}

		} catch (Exception err) {
			err.printStackTrace();
			//System.out.println("addInput() : " + err);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("커맨드");
		req.setAttribute("chart", a);
		req.setAttribute("chart1", b);
		
		return "Copy of test1234.jsp";
	}

}
