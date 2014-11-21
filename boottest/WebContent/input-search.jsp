<%@page import="semi.StockDto"%>
<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<%@ page import = "java.sql.*" %> 
<%@ page import = "java.util.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

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
				<div>�԰���ȸ</div><br/>
				<div>��ǰ�� : <input type="text" name="name"/></div>
				<div>��ǰ�ڵ� : <input type="text" name="code" /></div>
				<div>��¥ : <input type="text" id="datepicker" name="day" /></div>
           		<div>�μ��� : <input type="text" name="des" /></div>
				
			</div>
	<hr/>
			
				<div>					
					<input class="b1" type="submit" value="����" /> 					
					 					
				</div>
					
		</div>
	</form>
				
<br/>
<table border="1"><br/>
<c:if test="${empty ialls}">
	
</c:if>
<tr>
	<td>��ǰ�ڵ�</td>
	<td>��ǰ��</td>
	<td>�԰���</td>
	<td>�԰���</td>
	<td>�μ���ȣ</td>
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