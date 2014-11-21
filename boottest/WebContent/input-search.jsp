<%@page import="semi.StockDto"%>
<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<%@ page import = "java.sql.*" %> 
<%@ page import = "java.util.*" %> 
                <!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->

<html>
<head>
<%@include file="inc/css_and_js.jsp" %>
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
    	dateFormat:"yy/mm/dd"
    });
  });
  </script>
 
</head>

<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>
<br/>
	<form name="f" method="post" action="/semi/semi.do">
	<input type="hidden" name="command" value="input-search">
		<div style="border: 1px" >			
			<div>
				<div>입고조회</div><br/>
				<div>상품명 : <input type="text" name="name"/></div>
				<div>상품코드 : <input type="text" name="code" /></div>
				<div>날짜 : <input type="text" id="datepicker" name="day" /></div>
           		<div>부서명 : <input type="text" name="des" /></div>
				
			</div>
	<hr/>
			
				<div>					
					<input class="b1" type="submit" value="전송" /> 					
					 					
				</div>
					
		</div>
	</form>
				
<br/>
<table border="1"><br/>
<c:if test="${empty ialls}">
	
</c:if>
<tr>
	<td>상품코드</td>
	<td>상품명</td>
	<td>입고갯수</td>
	<td>입고일</td>
	<td>부서번호</td>
</tr>
	<c:forEach var="inputlist" items="${ialls}">
			<tr>
				<td>${inputlist.code }</td>					
				<td>${inputlist.name }</td>
				<td>${inputlist.count }</td>
				<td>${inputlist.idate }</td>				
				<td>${inputlist.des }</td>
			</tr>
			
	</c:forEach>

</table>
</body>
</html>