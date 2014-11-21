<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/modules/data.js"></script>
<script>
$(function () {
    $('#container').highcharts({
        data: {
            table: document.getElementById('datatable')
        },
        chart: {
            type: 'column'
        },
        title: {
            text: 'Data extracted from a HTML table in the page'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: 'Units'
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
});
</script>
</head>
<body>

<div>
      <form method="post" action="test1234.jsp">
         
         <div>
            <div></div><br/>
            <div>코드 : <input type="text" name="code" /></div>                  
         </div>
         <hr/>
         <div>
            <div>
               <input class="b1"  type="submit" value="전송"  />&nbsp;&nbsp;&nbsp;               
            </div>    
         </div>         
   </form>
</div>
<div id="container" style="width: 310px; height: 400px; margin: 0 auto"></div>
<table id="datatable">
<%!
   int tinput_count;
   int toutput_count;
   String name;
   String code;
%>
<%
ResultSet rs = null;
Connection conn = null;                                        // null로 초기화 한다.
PreparedStatement pstmt = null;
 

///직급검색
try{
   String url = "jdbc:mysql://192.168.10.49:3306/testboard";
   String id = "root";                                                    // 사용자 계정
   String pw = "1234";                                                // 사용자 계정의 패스워드

   Class.forName("com.mysql.jdbc.Driver");                      // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
   conn=DriverManager.getConnection(url,id,pw); 
   response.setCharacterEncoding("euc-kr");
   request.setCharacterEncoding("euc-kr");
   
   code = request.getParameter("code");
   
      String sql1 = "select name , sum(count) from tinput"; 
      pstmt = conn.prepareStatement(sql1);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
      
      rs = pstmt.executeQuery();// sql 쿼리
   
   %>
   <%=code%>
      <thead>
      <tr>
         <th>상품코드</th>
         <th>매입</th>
         <th>매출</th>
      </tr>
      </thead>
      <tbody>
   <%   
   
      while(rs.next()){
        name = rs.getString("name");        
        tinput_count = rs.getInt("sum(count)");
         
   %>      
      
      <tr>
         <th><%=name%></th>
         <td><%=tinput_count%></td>
         <td><%=toutput_count%></td>
	   </tr>
     <%}
   
   
   
   %> 


   </tbody>
   <%
      
   }
   catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
      //e.printStackTrace();
      //out.println("member 테이블 호출에 실패했습니다.");
   }
   finally   {                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
      if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
      if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
   }
%>
</table>
<%-- 
<div id="container" style="width: 310px; height: 400px; margin: 0 auto"></div>
<table id="datatable">
   <thead>
      <tr>
         <th>코드</th>
         <th>매입</th>
         <th>매출</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <th></th>
         <td><%=tinput_count%></td>
         <td><%=toutput_count%></td>
      </tr>
   
   </tbody>
</table> --%>
</body>
</html>