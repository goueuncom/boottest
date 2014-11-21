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
            <div>�ڵ� : <input type="text" name="code" /></div>                  
         </div>
         <hr/>
         <div>
            <div>
               <input class="b1"  type="submit" value="����"  />&nbsp;&nbsp;&nbsp;               
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
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
PreparedStatement pstmt = null;
 

///���ް˻�
try{
   String url = "jdbc:mysql://192.168.10.49:3306/testboard";
   String id = "root";                                                    // ����� ����
   String pw = "1234";                                                // ����� ������ �н�����

   Class.forName("com.mysql.jdbc.Driver");                      // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
   conn=DriverManager.getConnection(url,id,pw); 
   response.setCharacterEncoding("euc-kr");
   request.setCharacterEncoding("euc-kr");
   
   code = request.getParameter("code");
   
      String sql1 = "select name , sum(count) from tinput"; 
      pstmt = conn.prepareStatement(sql1);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
      
      rs = pstmt.executeQuery();// sql ����
   
   %>
   <%=code%>
      <thead>
      <tr>
         <th>��ǰ�ڵ�</th>
         <th>����</th>
         <th>����</th>
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
   catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
      //e.printStackTrace();
      //out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");
   }
   finally   {                                                            // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)
      if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset ��ü ����
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement ��ü ����
      if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection ����
   }
%>
</table>
<%-- 
<div id="container" style="width: 310px; height: 400px; margin: 0 auto"></div>
<table id="datatable">
   <thead>
      <tr>
         <th>�ڵ�</th>
         <th>����</th>
         <th>����</th>
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