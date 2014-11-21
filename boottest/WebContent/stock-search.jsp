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
	<input type="hidden" name="command" value="stock-search" />
		<table style="border: 1px solid black">			
			<tr>
				<td>상품코드 : </td>
				<td><input type="text" name="code" /></td>
			</tr>
	
				<tr>
				<td colspan="2" align="center">
					<input class="b1"  type="submit" value="전송"  />&nbsp;&nbsp;&nbsp;					
				</td> 	
			</tr>			
		</table>
	</form>
	

<table width="550" border="1">

	<tr class="lv-bg">
		<td width="120">상품코드</td>
		<td width="50">상품명</td>
		<td width="50">업체명</td>
		<td width="50">재고</td>
		<td width="50">입고단가</td>
		<td width="50">판매단가</td>
	</tr>
<c:forEach var="i" items="${v_stock_search}">
	<tr>
		<td width="100">${i.code }</td>
		<td width="100">${i.name }</td>
		<td width="100">${i.cname }</td>
		<td width="100">${i.count }</td>
		<td width="100">${i.price }</td>
		<td width="100">${i.sprice }</td>
	</tr>
</c:forEach>

</table>
</body>
</html>