<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="semi.StockDto"%>
<%@page import="semi.DBConnectionMgr" %>
<!DOCTYPE html >
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>

<%@include file="inc/css_and_js.jsp" %>

</head>

<body>

<%@include file="inc/buttoncss.jsp" %>

	<form method="post" action="/semi/semi.do">
	<input type="hidden" name="command" value="des-sal-search" />
			
			<div>
				<div></div><br/>
				<div>�μ���ȣ �˻� : <input type="text" name="des" /></div>				
				<div>���� �˻� : <input type="text" name="posname" /></div>				
			</div>
			<hr/>
			<div>
				<div>
					<input class="b1"  type="submit" value="����"  />&nbsp;&nbsp;&nbsp;					
				</div> 	
			</div>			
		
	</form>
	
<br/>
<table width="550" border="1">

		<tr class="lv-bg">		
			<td width="50">�μ���ȣ</td>
			<td width="50">����</td>
			<td width="50">�޿�</td>
		</tr>
<c:forEach var="des" items="${dessal}">
	<tr class="lv-bg">
		<td width="50">${des.pdes}</td>
		<td width="50">${des.posname}</td>
		<td width="50">${des.psa}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>