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
	Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
	PreparedStatement pstmt = null;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		try{
			   pool = DBConnectionMgr.getInstance();		
			   conn= pool.getConnection(); 
			 //  System.out.println("command�Դ�!");
			   StockDto dto = new StockDto();
			             // DriverManager ��ü�κ��� Connection ��ü�� ���´�.
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
			    	System.out.println("�ڵ尡 �ߺ��Ǿ����ϴ�..");
			    }	   
			   }
			   catch(Exception e){                                                   // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.

				   System.out.println("add_listCommand() :" +e); 
			   }
			   finally   {                                                            // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)
					pool.freeConnection(conn, pstmt, rs);
			   }
		return "add-list.jsp";
	}

}
