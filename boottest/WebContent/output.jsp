<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
<%@ page import = "semi.DBConnectionMgr" %> 
                <!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->

<html>
<head>
<%@include file="inc/css_and_js.jsp" %>

  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
    	dateFormat:"yy/mm/dd"
    });
  });
  </script>
</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

   <form method="post" action="/semi/semi.do">
   <input type="hidden" name="command" value="output" />
      <div style="border: 1px" >         
         <div>
            <div>입고입력</div>
            <div>상품코드 : <input type="text" name="code" /></div>            
            <div>입고갯수 : <input type="text" name="count" /></div>
            <div>출고날짜 : <input type="text" id="datepicker" name="odate" /></div>
         </div>
   <hr/>
         
            <div>               
               <input class="b1" type="submit" value="전송" />               
            </div>
               
      </div>
   </form>


<table width="550" border="1">
</table>
</body>
</html>