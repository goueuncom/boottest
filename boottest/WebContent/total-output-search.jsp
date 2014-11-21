<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/table.css">
<%@include file="inc/css_and_js.jsp" %>
</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>
<form method="post" action="/semi/semi.do">
<input type="hidden" name="command" value="total-output-search" />
���� : 		<!-- ��ǰ�ڵ�, ��ǰ��, �ŷ�ó, �μ��� ���� -->
<input type="radio" name="code" value="code" />��ǰ�ڵ�&nbsp;
<input type="radio" name="code" value="name" />��ǰ��&nbsp;
<input type="radio" name="code" value="cname" />ȸ���&nbsp;
<input type="radio" name="code" value="des" />�μ���&nbsp;
<input class="b1" type="submit" value="����" />&nbsp;
</form>

<table width="550" border="1">

<c:if test="${param.code eq 'code'}">

	<tr class="lv-bg">
		<td width="100">��ǰ�ڵ�</td>
		<td width="100">��ǰ��</td>
		<td width="100">ȸ���</td>
		<td width="100">�μ���</td>
		<td width="100">�Ѱ�</td>
		<td width="100">�� ����</td>
	</tr>
	
	<c:forEach var="outputlist" items="${outputlist}">
			
	<tr>
		<td width="100">${outputlist.code}</td>
		<td width="100">${outputlist.name}</td>
		<td width="100">${outputlist.cname}</td>
		<td width="100">${outputlist.des}</td>

		<c:forEach var="totallist" items="${totallist}">
			<c:if test="${outputlist.code eq totallist.code}">
				<td width="100">
					<fmt:formatNumber value="${totallist.count}"	/></td>
				<td width="100">
					<fmt:formatNumber value="${totallist.price}" type="currency"/></td>
			</c:if>
		</c:forEach>

	</tr>
	
	</c:forEach>
</c:if>

<c:if test="${param.code eq 'name'}">
	<tr class="lv-bg">
		<td width="100">��ǰ��</td>
		<td width="100">ȸ���</td>
		<td width="100">�μ���</td>
		<td width="100">�Ѱ�</td>
		<td width="100">�� ����</td>
	</tr>
	
	<c:forEach var="outputlist" items="${outputlist}">
	<tr>
		<td width="100">${outputlist.name}</td>
		<td width="100">${outputlist.cname}</td>
		<td width="100">${outputlist.des}</td>
		
		<c:forEach var="totallist" items="${totallist}">
			<c:if test="${outputlist.name eq totallist.name}">
				<td width="100">
					<fmt:formatNumber value="${totallist.count}"	/></td>
				<td width="100">
					<fmt:formatNumber value="${totallist.price}" type="currency"/></td>
			</c:if>
			
		</c:forEach>
	 
	</c:forEach>
	</tr>
</c:if>

<c:if test="${param.code eq 'cname'}">
	<tr class="lv-bg">
		<td width="100">ȸ���</td>
		<td width="100">��ǰ��</td>
		<td width="100">�Ѱ�</td>
		<td width="100">�� ����</td>
	</tr>
	
	<c:forEach var="outputlist" items="${outputlist}">
	<tr>
		<td width="100">${outputlist.cname}</td>
		<td width="100">${outputlist.name}</td>
		
		<c:forEach var="totallist" items="${totallist}">
			<c:if test="${outputlist.cname eq totallist.cname && outputlist.name eq totallist.name}">
				<td width="100">
					<fmt:formatNumber value="${totallist.count}"	/></td>
				<td width="100">
					<fmt:formatNumber value="${totallist.price}" type="currency"/></td>
			</c:if>
			
		</c:forEach>
		
	</tr>
	
		<c:forEach var="partlist" items="${partlist}">
			<c:if test="${outputlist.code eq partlist.code}">
				<tr>
					<td width="100">��ü�� �Ѱ�</td>
					<td width="100">${outputlist.cname}</td>
					<td width="100">
						<fmt:formatNumber value="${partlist.count}"	/></td>
					<td width="100">
						<fmt:formatNumber value="${partlist.price}" type="currency"/></td>
				</tr>
			</c:if>
		</c:forEach>
		
	</c:forEach>
</c:if>

<c:if test="${param.code eq 'des'}">
	<tr class="lv-bg">
		<td width="100">�μ���</td>
		<td width="100">��ǰ��</td>
		<td width="100">ȸ���</td>
		<td width="100">�Ѱ�</td>
		<td width="100">�� ����</td>
	</tr>
	
	<c:forEach var="outputlist" items="${outputlist}">
	<tr>
		<td width="100">${outputlist.des}</td>
		<td width="100">${outputlist.name}</td>
		<td width="100">${outputlist.cname}</td>

	<c:forEach var="totallist" items="${totallist}">
		<c:if test="${outputlist.des eq totallist.des && outputlist.name eq totallist.name}">
			<td width="100">
					<fmt:formatNumber value="${totallist.count}"	/></td>
				<td width="100">
					<fmt:formatNumber value="${totallist.price}" type="currency"/></td>
		</c:if>
		
	</c:forEach>
	
		<c:forEach var="partlist" items="${partlist}">
			<c:if test="${outputlist.code eq partlist.code}">
				<tr>
					<td width="100" colspan="2">�μ��� �Ѱ�</td>
					<td width="100">${outputlist.des}</td>
					<td width="100">
						<fmt:formatNumber value="${partlist.count}"	/></td>
					<td width="100">
						<fmt:formatNumber value="${partlist.price}" type="currency"/></td>
				</tr>
			</c:if>
		</c:forEach>
		
	</c:forEach>

	</tr>

</c:if>

	<tr>
		<td>�Ѿ�</td>
		<td colspan="7" align="center">
			<fmt:formatNumber value="${totalPrice}" type="currency"/></td>
	</tr>
</table>
</body>
</html>