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


public class OutputCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		StockDto stockdto = new StockDto();
		stockdto.setCode(Integer.parseInt(req.getParameter("code")));
		stockdto.setCount(Integer.parseInt(req.getParameter("count")));
		stockdto.setOdate(req.getParameter("odate"));

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();

			sql = "select iname, cname, price, sprice , des from tlist where code = ?"; // sql
																						// 쿼리
			pstmt = con.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리
												// 컴파일한다.
			pstmt.setInt(1, stockdto.getCode());
			rs = pstmt.executeQuery();
			rs.next();
			stockdto.setName(rs.getString("iname"));
			stockdto.setCname(rs.getString("cname"));
			stockdto.setPrice(rs.getInt("price"));
			stockdto.setSprice(rs.getInt("sprice"));
			stockdto.setDes(rs.getInt("des"));
			
			
			sql = "select count from tstock where code = ?"; // sql
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stockdto.getCode());
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt("count");
			int ocount = stockdto.getCount();
			if(count>ocount){
			
			String sql3 = "update tstock set count = count- ? where code=?";
			pstmt = con.prepareStatement(sql3);

			pstmt.setInt(1, stockdto.getCount());
			pstmt.setInt(2, stockdto.getCode());
			int result = pstmt.executeUpdate();

			if (result == 0) {
				sql = "INSERT into tstock VALUES(?, ?, ?, ?, ?, ?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, stockdto.getCode());
				pstmt.setString(2, stockdto.getName());
				pstmt.setString(3, stockdto.getCname());
				pstmt.setInt(4, stockdto.getCount());
				pstmt.setInt(5, stockdto.getPrice());
				pstmt.setInt(6, stockdto.getSprice());
				pstmt.setInt(7, stockdto.getDes());
				pstmt.executeUpdate();

				sql = "INSERT INTO toutput VALUES(?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, stockdto.getCode());
				pstmt.setString(2, stockdto.getName());
				pstmt.setInt(3, stockdto.getCount());
				pstmt.setString(4, stockdto.getOdate());
				pstmt.setInt(5, stockdto.getDes());
				pstmt.executeUpdate();
			}
			else{
			sql = "INSERT INTO toutput VALUES(?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stockdto.getCode());
			pstmt.setString(2, stockdto.getName());
			pstmt.setInt(3, stockdto.getCount());
			pstmt.setString(4, stockdto.getOdate());
			pstmt.setInt(5, stockdto.getDes());
			pstmt.executeUpdate();
			}
		}
			else{
				System.out.println("재고가 없거나 리스트에 없는 상품입니다.");
			}
		} catch (Exception err) {
			System.out.println("재고가 없거나 리스트에 없는 상품입니다.");
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return "output.jsp";
	}

}
