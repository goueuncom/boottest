<%@page contentType="text/html;charset=euc-kr" %>
<%@ page import = "semi.DBConnectionMgr" %> 
<!DOCTYPE html >
<%@ page import="java.sql.Connection,java.sql.Date,java.sql.DriverManager
,java.sql.ResultSet,java.sql.SQLException,java.sql.SQLIntegrityConstraintViolationException,
java.sql.Statement,java.util.Scanner" %>
<%@ page import = "java.sql.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<%@include file="inc/css_and_js.jsp" %>
</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>
<form method="post" action="output-all-search.jsp">
���� : 
<input type="radio" name="code" value="code" />��ǰ�ڵ�&nbsp;
<input type="radio" name="code" value="count" />����&nbsp;
<input type="radio" name="code" value="odate" />�����&nbsp;
<input class="b1" type="submit" value="����" />&nbsp;
</form>


<table width="550" border="1">
<%
ResultSet rs = null;
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
Statement pstmt = null;
DBConnectionMgr pool = null;

try{
	pool=DBConnectionMgr.getInstance();
	conn=pool.getConnection();
	
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String sort = request.getParameter("code");
	
	out.println(sort);
	String sql = "select * from toutput order by "+sort;                        // sql ����
	out.println(sql);
	pstmt = conn.createStatement();                       // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
	rs = pstmt.executeQuery(sql);                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
%>
	<tr class="lv-bg">
		<td width="100">��ǰ�ڵ�</td>
		<td width="100">��ǰ��</td>
		<td width="100">�԰���</td>
		<td width="100">�԰���</td>
	</tr>
<%	
	while(rs.next()){                                                        // ����� �� �྿ ���ư��鼭 �����´�.
		int code = rs.getInt("code");
		String name = rs.getString("name");
		int count = rs.getInt("count");
		Date date = rs.getDate("odate");	
		
%>		
	<tr>
		<td width="100"><%=code%></td>
		<td width="100"><%=name%></td>
		<td width="100"><%=count%></td>
		<td width="100"><%=date%></td>
	</tr>

<%
		}

	}
	catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		e.printStackTrace();
		out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");
	}
	finally	{                                                            // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)
		if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset ��ü ����
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement ��ü ����
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection ����
	}
%>
</table>
</body>
</html>