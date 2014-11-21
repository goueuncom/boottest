package semi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Stock_searchCommand implements Command {
	Vector v_stock_search = new Vector();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;
	String sql = null;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String code = req.getParameter("code");
		System.out.println(code);
		
		pool = DBConnectionMgr.getInstance();
		try{
			con = pool.getConnection();
			
			if(code != ""){
				sql= "SELECT * FROM tstock WHERE code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, code);
			}
			if(code == ""){
				sql= "SELECT * FROM tstock";
				pstmt = con.prepareStatement(sql);
			}
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				StockDto dto = new StockDto();
				dto.setCode(rs.getInt("code"));
				dto.setName(rs.getString("iname"));
				dto.setCname(rs.getString("cname"));
				dto.setCount(rs.getInt("count"));
				dto.setPrice(rs.getInt("count"));
				dto.setSprice(rs.getInt("sprice"));
				v_stock_search.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("Stock_searchCommand : "+err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("v_stock_search", v_stock_search);
		return "stock-search.jsp";
	}

}
