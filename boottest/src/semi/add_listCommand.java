package semi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class add_listCommand implements Command{
	DBConnectionMgr pool = null;
	ResultSet rs = null;
	Connection conn = null;                                        // null로 초기화 한다.
	PreparedStatement pstmt = null;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		try{
			   pool = DBConnectionMgr.getInstance();		
			   conn= pool.getConnection(); 
			 //  System.out.println("command왔다!");
			   StockDto dto = new StockDto();
			             // DriverManager 객체로부터 Connection 객체를 얻어온다.
			  // System.out.println(req.getParameter("code"));
			   
			   dto.setCode(Integer.parseInt(req.getParameter("code")));
			   dto.setName(req.getParameter("name"));
			   dto.setCname(req.getParameter("com"));		   
			   dto.setPrice(Integer.parseInt(req.getParameter("price")));
			   dto.setSprice(Integer.parseInt(req.getParameter("sprice")));
			   dto.setDes(Integer.parseInt(req.getParameter("desc")));
			 
			  

	
				String sql3 = "update tlist set code = code where code=?";
				pstmt = conn.prepareStatement(sql3);	        
				pstmt.setInt(1, dto.getCode()); //code   
				int result = pstmt.executeUpdate();   
				
				if(result == 0){
			    	String sql4 = "insert into tlist values(?, ?, ?, ?, ?, ?)";            
			        pstmt = conn.prepareStatement(sql4);
			        pstmt.setInt(1, dto.getCode());
			        pstmt.setString(2, dto.getName());
			        pstmt.setString(3, dto.getCname());
			        pstmt.setInt(4, dto.getPrice());
			        pstmt.setInt(5, dto.getSprice());
			        pstmt.setInt(6, dto.getDes());
			        pstmt.executeUpdate();
			    	
			    }
			    else{    	
			    	System.out.println("코드가 중복되었습니다..");
			    }	   
			   }
			   catch(Exception e){                                                   // 예외가 발생하면 예외 상황을 처리한다.

				   System.out.println("add_listCommand() :" +e); 
			   }
			   finally   {                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
					pool.freeConnection(conn, pstmt, rs);
			   }
		return "add-list.jsp";
	}

}
