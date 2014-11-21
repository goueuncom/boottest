<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<%@include file="inc/css_and_js.jsp" %>
</head>

<body>
<%@include file="inc/pasdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

	<form method="post" action="/semi/semi.do">
   <input type="hidden" name="command" value="final-sal-search" />
		<table style="border: 1px solid black">			
			<tr>
				<td>�����ȣ �˻� : </td>
				<td><input type="text" name="pcode" /></td>				
			</tr>
	
				<tr>
				<td colspan="2" align="center">
					<input class="b1"  type="submit" value="����"  />&nbsp;&nbsp;&nbsp;					
				</td> 	
			</tr>			
		</table>
	</form>
	
<br/>
 
<table width="550" border="1">

<tr class="lv-bg">		
		<td width="50">�����</td>
		<td width="50">�μ���ȣ</td>
		<td width="50">����</td>
		<td width="50">����</td>
		<td width="50">����</td>
		<td width="50">�����޿�</td>
		
	</tr>
	

<c:forEach var="i" items="${final1}">
	<tr>
		<td width="100">${i.pname }</td>
		<td width="100">${i.pdes }</td>		
		<td width="100">${i.posname }</td>
		<td width="100">${i.unpaid }</td>
		<td width="100">${i.late }</td>
		<td width="100">${i.psa }</td> 
	</tr>
</c:forEach>
</table>
</body>
</html>