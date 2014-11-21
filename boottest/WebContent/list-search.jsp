<%@page import="semi.StockDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >

<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<%@include file="inc/css_and_js.jsp" %>

</head>

<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

	<form method="post" action="/semi/semi.do">
	<input type="hidden" name="command" value="list-search" />
		<table style="border: 1px solid black">			
			<tr>
				<td>��ǰ�ڵ� : </td>
				<td><input type="text" name="code" /></td>
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
		<td width="200">��ǰ�ڵ�</td>
		<td width="100">��ǰ��</td>
		<td width="100">��ü��</td>		
		<td width="100">�԰�ܰ�</td>
		<td width="100">�ǸŴܰ�</td>
		<td width="100">�μ���ȣ</td>
	</tr>
<c:forEach var="i" items="${List}">
	<tr>
		<td width="100">${i.code }</td>
		<td width="100">${i.name }</td>		
		<td width="100">${i.cname }</td>
		<td width="100">${i.price }</td>		
		<td width="100">${i.sprice }</td>		
		<td width="100">${i.des }</td>		
	</tr>
</c:forEach>

</table>
</body>
</html>