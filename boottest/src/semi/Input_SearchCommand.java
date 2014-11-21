package semi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Input_SearchCommand implements Command {
	Vector vInput = new Vector();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;
	String sql = null;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		
		System.out.println("1");
		pool = DBConnectionMgr.getInstance();
		try {
			conn = pool.getConnection();
			
		try{
			if(req.getParameter("name") != null){
				String sql = "select * from tinput where name = ? order by code";                        // sql 쿼리
				pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
				pstmt.setString(1,req.getParameter("name"));
				rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
				
				while(rs.next()){                                                        // 결과를 한 행씩 돌아가면서 가져온다.
					StockDto stockdto = new StockDto();
					stockdto.setCode(rs.getInt("code"));
					stockdto.setName(rs.getString("name"));
					stockdto.setCount(rs.getInt("count"));
					stockdto.setIdate(rs.getString("idate"));
					stockdto.setDes(rs.getInt("des"));
					vInput.add(stockdto);
				}
				
			}
		}catch(NullPointerException ex){
			System.out.println("name" + ex);
		}

		
		
		try{
			if(req.getParameter("code") != null){
				String sql1 = "select * from tinput where code = ?";
				pstmt = conn.prepareStatement(sql1);                          
				pstmt.setString(1,req.getParameter("code"));
				rs = pstmt.executeQuery();                                    
				
				while(rs.next()){                                             
					StockDto stockdto = new StockDto();
					stockdto.setCode(rs.getInt("code"));
					stockdto.setName(rs.getString("name"));
					stockdto.setCount(rs.getInt("count"));
					stockdto.setIdate(rs.getString("idate"));
					stockdto.setDes(rs.getInt("des"));
					vInput.add(stockdto);
				}
			}
		}catch(NullPointerException ex){
			System.out.println("code" + ex);
		}
			System.out.println("2");
			
		try{
			if(req.getParameter("day") != null){
				String sql2 = "select * from tinput where idate = ?";
				pstmt = conn.prepareStatement(sql2);                          
				pstmt.setString(1,req.getParameter("day"));
				rs = pstmt.executeQuery();                                    
				
				while(rs.next()){                                             
					StockDto stockdto = new StockDto();
					stockdto.setCode(rs.getInt("code"));
					stockdto.setName(rs.getString("name"));
					stockdto.setCount(rs.getInt("count"));
					stockdto.setIdate(rs.getString("idate"));
					stockdto.setDes(rs.getInt("des"));
					vInput.add(stockdto);
				}
			}
		}catch(NullPointerException ex){
			System.out.println("idate" + ex);
		}	
			
			System.out.println("3");
			
		try{
			if(req.getParameter("des") != null){	
				String sql4 = "select * from tinput where des = ?";
				pstmt = conn.prepareStatement(sql4);                          
				pstmt.setString(1,req.getParameter("des"));
				rs = pstmt.executeQuery();                                    
				
				while(rs.next()){                                             
					StockDto stockdto = new StockDto();
					stockdto.setCode(rs.getInt("code"));
					stockdto.setName(rs.getString("name"));
					stockdto.setCount(rs.getInt("count"));
					stockdto.setIdate(rs.getString("idate"));
					stockdto.setDes(rs.getInt("des"));
					vInput.add(stockdto);
				}
			}
		}catch(NullPointerException ex){
			System.out.println("des" + ex);
		}
			System.out.println("4");
			
			
		} catch (Exception e) {
			System.out.println("input_search err" + e);
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		req.setAttribute("ialls", vInput);
		return "input-search.jsp";
	}

}
