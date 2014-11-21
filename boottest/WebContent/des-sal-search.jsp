<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="semi.StockDto"%>
<%@page import="semi.DBConnectionMgr" %>
<!DOCTYPE html >
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
                <!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->

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
				<div>부서번호 검색 : <input type="text" name="des" /></div>				
				<div>직급 검색 : <input type="text" name="posname" /></div>				
			</div>
			<hr/>
			<div>
				<div>
					<input class="b1"  type="submit" value="전송"  />&nbsp;&nbsp;&nbsp;					
				</div> 	
			</div>			
		
	</form>
	
<br/>
<table width="550" border="1">

		<tr class="lv-bg">		
			<td width="50">부서번호</td>
			<td width="50">직급</td>
			<td width="50">급여</td>
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