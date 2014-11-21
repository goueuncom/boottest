<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<%@include file="inc/css_and_js.jsp" %>
</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>
<form method="post" action="/semi/semi.do">
<input type="hidden" name="command" value="output-all-search" />
정렬 : 
<input type="radio" name="code" value="code" />상품코드&nbsp;
<input type="radio" name="code" value="count" />갯수&nbsp;
<input type="radio" name="code" value="odate" />출고일&nbsp;
<input class="b1" type="submit" value="정렬" />&nbsp;
</form>


<table width="550" border="1">

	<tr class="lv-bg">
		<td width="100">상품코드</td>
		<td width="100">상품명</td>
		<td width="100">출고갯수</td>
		<td width="100">출고일</td>
	</tr>
<c:forEach var="i" items="${v_output_all_search}">
	<tr>
		<td width="100">${i.code }</td>
		<td width="100">${i.name }</td>
		<td width="100">${i.count }</td>
		<td width="100">${i.odate }</td>
	</tr>
 </c:forEach>
</table>
</body>
</html>