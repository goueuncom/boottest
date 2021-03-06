<%@page import="semi.DBConnectionMgr" %>
<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
                <!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->

<html>
<head>
<%@include file="inc/css_and_js.jsp" %>

</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

   <form method="post" action="add-list.jsp">
      <div style="border: 1px" >         
         <div>
            <div>상품 리스트 추가</div>
            <div>상품 코드 : <input type="text" name="code" /></div>
            <div>상품명 : <input type="text" name="name" /></div>
            <div>업체명 : <input type="text" name="com" /></div>
            <div>입고단가 : <input type="text" name="price" /></div>
            <div>출고단가 : <input type="text" name="sprice" /></div>
            <div>부서코드 : <input type="text" name="desc" /></div>
         </div>
   <hr/>
         
            <div>               
               <input class="b1" type="submit" value="전송" /> 
               <input class="b1" type="reset" value="reset" />              
            </div>
               
      </div>
   </form>


<table width="550" border="1">
<%
DBConnectionMgr pool = null;
ResultSet rs = null;
Connection conn = null;                                        // null로 초기화 한다.
PreparedStatement pstmt = null;

try{
   pool = DBConnectionMgr.getInstance();		
   conn= pool.getConnection(); 
   request.setCharacterEncoding("euc-kr");
   response.setCharacterEncoding("euc-kr");
   
             // DriverManager 객체로부터 Connection 객체를 얻어온다.
   
   
	String a = request.getParameter("code");  
	String name = request.getParameter("name");
	String com = request.getParameter("com");
	String price = request.getParameter("price");
	String sprice = request.getParameter("sprice");
	String desc = request.getParameter("desc");


////////////////////
	String sql3 = "update tlist set code = code where code=?";
	pstmt = conn.prepareStatement(sql3);
        
	pstmt.setString(1, a); //code   
	int result = pstmt.executeUpdate();   
	if(result == 0){
    	String sql4 = "insert into tlist values(?, ?, ?, ?, ?, ?)";            
        pstmt = conn.prepareStatement(sql4);
        pstmt.setString(1, a);
        pstmt.setString(2, name);
        pstmt.setString(3, com);
        pstmt.setString(4, price);
        pstmt.setString(5, sprice);
        pstmt.setString(6, desc);
        pstmt.executeUpdate();
    	
    }
    else{    	
    	out.println("코드가 중복되었습니다..");
    }

/////////////////////////

   
   }
   catch(Exception e){                                                   // 예외가 발생하면 예외 상황을 처리한다.

      out.println("입력된 값이 없거나 리스트에 없는 상품입니다."); 
   }
   finally   {                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
      if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
      if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
   }
%>
</table>
</body>
</html>