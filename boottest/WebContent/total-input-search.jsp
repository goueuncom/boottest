<%@page import="semi.StockDto"%>
<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function validateForm() {
	//alert("test validateform");
    if ($(".submitChk").length == 0) {
        alert("����� ������� �����ϴ�.");
    }
    else{
    	return true;
    }
    return false;
}
</script>
<%@include file="inc/css_and_js.jsp" %>
</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>
<form method="post" action="/semi/semi.do">
<input type="hidden" name="command" value="total-input-search" />
���� : 		<!-- ��ǰ�ڵ�, ��ǰ��, �ŷ�ó, �μ��� ���� -->
<input type="radio" name="code" value="code" />��ǰ�ڵ�&nbsp;
<input type="radio" name="code" value="name" />��ǰ��&nbsp;
<input type="radio" name="code" value="cname" />ȸ���&nbsp;
<input type="radio" name="code" value="des" />�μ���&nbsp;
<input class="b1" type="submit" value="����" />&nbsp;
</form>

<!-- submit : excel start -->
<form method="post" action="/semi/excel.do" onsubmit="return validateForm()">
<input type="hidden" name="command" value="excel-input" />
<input type="submit" name="excel" value="���Ϸ� ��������"	/>
</form>		<!-- submit : excel end -->

<table width="550" border="1" id="table">

<c:if test="${param.code eq 'code'}">

	<tr class="lv-bg">
		<td width="100">��ǰ�ڵ�</td>
		<td width="100">��ǰ��</td>
		<td width="100">ȸ���</td>
		<td width="100">�μ���</td>
		<td width="100">�� �԰��</td>
	</tr>
	
	<c:forEach var="totallist" items="${totallist}">
		<tr class="submitChk">
			<td width="100">${totallist.code}</td>
			<td width="100">${totallist.name}</td>
			<td width="100">${totallist.cname}</td>
			<td width="100">${totallist.des}</td>
			<td width="100">
				<fmt:formatNumber value="${totallist.price}" type="currency"/></td>
		</tr>
	
	</c:forEach>
</c:if>

<c:if test="${param.code eq 'name'}">
	<tr class="lv-bg">
		<td width="100">��ǰ��</td>
		<td width="100">ȸ���</td>
		<td width="100">�μ���</td>
		<td width="100">�� �԰��</td>
	</tr>
	
	<c:forEach var="totallist" items="${totallist}">
	<tr class="submitChk">
		<td width="100">${totallist.name}</td>
		<td width="100">${totallist.cname}</td>
		<td width="100">${totallist.des}</td>
		<td width="100">
					<fmt:formatNumber value="${totallist.price}" type="currency"/></td>
		
	</c:forEach>
	</tr>
</c:if>

<c:if test="${param.code eq 'cname'}">
	<tr class="lv-bg">
		<td width="100">ȸ���</td>
		<td width="100">��ǰ��</td>
		<td width="100">�� �԰��</td>
	</tr>
	
	<c:forEach var="totallist" items="${totallist}">
	<tr class="submitChk">
		<td width="100">${totallist.cname}</td>
		<td width="100">${totallist.name}</td>
		<td width="100">
					<fmt:formatNumber value="${totallist.price}" type="currency"/></td>
		
	</tr>
	
		<c:forEach var="partlist" items="${partlist}">
			<c:if test="${totallist.code eq partlist.code}">
				<tr>
					<td width="100">��ü�� �Ѱ�</td>
					<td width="100">${partlist.cname}</td>
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
		<td width="100">�� �԰��</td>
	</tr>
	
	<c:forEach var="totallist" items="${totallist}">
	<tr class="submitChk">
		<td width="100">${totallist.des}</td>
		<td width="100">${totallist.name}</td>
		<td width="100">${totallist.cname}</td>
		<td width="100">
					<fmt:formatNumber value="${totallist.price}" type="currency"/></td>
	
		<c:forEach var="partlist" items="${partlist}">
			<c:if test="${totallist.code eq partlist.code}">
				<tr>
					<td width="100" colspan="2">�μ��� �Ѱ�</td>
					<td width="100">${partlist.des}</td>
					<td width="100">
						<fmt:formatNumber value="${partlist.price}" type="currency"/></td>
				</tr>
			</c:if>
		</c:forEach>
		
	</c:forEach>

</c:if>

	<tr>
		<td>�Ѿ�</td>
		<td colspan="7" align="center">
			<fmt:formatNumber value="${totalPrice}" type="currency"/></td>
	</tr>
</table>

</body>
</html>