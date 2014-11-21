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


public class InputCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		StockDto stockdto = new StockDto();
		stockdto.setCode(Integer.parseInt(req.getParameter("code")));
		stockdto.setCount(Integer.parseInt(req.getParameter("count")));
		stockdto.setIdate(req.getParameter("idate"));
		Vector vAddr = new Vector();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		pool = DBConnectionMgr.getInstance();
		try {
			con = pool.getConnection();

			sql = "SELECT iname, cname, price, sprice, des FROM tlist WHERE code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stockdto.getCode());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				stockdto.setName(rs.getString("iname"));
				stockdto.setCname(rs.getString("cname"));
				stockdto.setPrice(rs.getInt("price"));
				stockdto.setSprice(rs.getInt("sprice"));
				stockdto.setDes(rs.getInt("des"));
				
			}

			sql = "UPDATE tstock SET count = count+ ? WHERE code=?";
			pstmt = con.prepareStatement(sql);
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

				sql = "INSERT INTO tinput VALUES(?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, stockdto.getCode());
				pstmt.setString(2, stockdto.getName());
				pstmt.setInt(3, stockdto.getCount());
				pstmt.setString(4, stockdto.getIdate());
				pstmt.setInt(5, stockdto.getDes());
				pstmt.executeUpdate();
			}
			else{
				sql = "INSERT INTO tinput VALUES(?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, stockdto.getCode());
				pstmt.setString(2, stockdto.getName());
				pstmt.setInt(3, stockdto.getCount());
				pstmt.setString(4, stockdto.getIdate());
				pstmt.setInt(5, stockdto.getDes());
				pstmt.executeUpdate();
			}
		} catch (Exception err) {
			err.printStackTrace();
			//System.out.println("addInput() : " + err);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("input", vAddr);
		return "input.jsp";
	}

}
