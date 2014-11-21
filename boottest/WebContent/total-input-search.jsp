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
        alert("출력할 결과물이 없습니다.");
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
정렬 : 		<!-- 상품코드, 상품명, 거래처, 부서별 정렬 -->
<input type="radio" name="code" value="code" />상품코드&nbsp;
<input type="radio" name="code" value="name" />상품명&nbsp;
<input type="radio" name="code" value="cname" />회사명&nbsp;
<input type="radio" name="code" value="des" />부서명&nbsp;
<input class="b1" type="submit" value="정렬" />&nbsp;
</form>

<!-- submit : excel start -->
<form method="post" action="/semi/excel.do" onsubmit="return validateForm()">
<input type="hidden" name="command" value="excel-input" />
<input type="submit" name="excel" value="파일로 내보내기"	/>
</form>		<!-- submit : excel end -->

<table width="550" border="1" id="table">

<c:if test="${param.code eq 'code'}">

	<tr class="lv-bg">
		<td width="100">상품코드</td>
		<td width="100">상품명</td>
		<td width="100">회사명</td>
		<td width="100">부서명</td>
		<td width="100">총 입고액</td>
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
		<td width="100">상품명</td>
		<td width="100">회사명</td>
		<td width="100">부서명</td>
		<td width="100">총 입고액</td>
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
		<td width="100">회사명</td>
		<td width="100">상품명</td>
		<td width="100">총 입고액</td>
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
					<td width="100">업체별 총계</td>
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
		<td width="100">부서명</td>
		<td width="100">상품명</td>
		<td width="100">회사명</td>
		<td width="100">총 입고액</td>
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
					<td width="100" colspan="2">부서별 총계</td>
					<td width="100">${partlist.des}</td>
					<td width="100">
						<fmt:formatNumber value="${partlist.price}" type="currency"/></td>
				</tr>
			</c:if>
		</c:forEach>
		
	</c:forEach>

</c:if>

	<tr>
		<td>총액</td>
		<td colspan="7" align="center">
			<fmt:formatNumber value="${totalPrice}" type="currency"/></td>
	</tr>
</table>

</body>
</html>