package semi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class des_sal_searchCommand implements Command{
	Vector vAddr = new Vector();
	ResultSet rs = null;
	Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
	PreparedStatement pstmt = null;
	DBConnectionMgr pool = null; 
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	///��ü�˻� , �μ���ȣ�˻�
	try{
		   pool = DBConnectionMgr.getInstance();		
		   conn= pool.getConnection(); 
		String des = req.getParameter("des");
		String posname = req.getParameter("posname");
		String sql="";
		if(posname == "" && des =="" ){
	        sql = "select pdes , posname , psa from pposit p , psal s where p.pnum = s.pnum";                     
	        pstmt = conn.prepareStatement(sql);                       
	     }
	   
	   else if(posname != "" && des =="" ){
	      System.out.println("1");
	      sql = "select pdes , posname , psa from pposit p , psal s where p.pnum = s.pnum"; 
	      if(posname!=""){sql+=" AND posname='"+posname+"'";}
	      System.out.println(sql);
	      pstmt = conn.prepareStatement(sql);      
	   }
	   else if(posname == "" && des !="" ){
	      System.out.println("2");
	      sql = "select pdes , posname , psa from pposit p , psal s where p.pnum = s.pnum"; 
	      if(des!=""){sql+=" AND pdes="+des;}
	      System.out.println(sql);
	      pstmt = conn.prepareStatement(sql);      
	   }
	   else if(posname != "" && des !="" ){
	      System.out.println("3");
	      sql = "select pdes , posname , psa from pposit p , psal s where p.pnum = s.pnum"; 
	      if(des!=""){sql+=" AND ( pdes="+des;}
	      if(posname!=""){sql+=" OR posname='"+posname+"' )";}
	      System.out.println(sql);
	      pstmt = conn.prepareStatement(sql);      
	   }
		
			rs = pstmt.executeQuery();// sql ����
		

		while(rs.next()){	
			 StockDto dto = new StockDto();
			 dto.setPdes(rs.getInt("pdes"));
			 dto.setPosname(rs.getString("posname"));
			 dto.setPsa(rs.getInt("psa"));		
			 vAddr.add(dto);
		}
	}
	catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		//e.printStackTrace();
		//out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");
	}

	finally	{                                                            // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)
		pool.freeConnection(conn,pstmt,rs);
		}
		req.setAttribute("des-sal", vAddr);
		return "des-sal-search.jsp";
	}

}
