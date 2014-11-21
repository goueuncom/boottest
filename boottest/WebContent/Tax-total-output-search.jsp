<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="inc/css_and_js.jsp" %>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="bootstrap/js/bootstrap.js"></script>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>
  <script>
  $(function() {
	    $('#container').highcharts({
	        data: {
	            table: document.getElementById('datatable')
	        },
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: '�ΰ���'
	        },
	        yAxis: {
	            allowDecimals: false,
	            title: {
	                text: '����:����'
	            }
	        },
	        tooltip: {
	            formatter: function () {
	                return '<b>' + this.series.name + '</b><br/>' +
	                this.point.name.toLowerCase()  + ' ' +  this.point.y + '����';
	            }
	        }
	    });
	});
  

  
</script> 

</head>
<body>


<form method="post" action="/semi/semi.do">
<input type="hidden" name="command" value="Tax-output-search" />
<input type="hidden" name="code" value="cname" />
<div style="float: left">
	<select name="year" class="btn">
	  <option value="2010">2010</option>
	  <option value="2011">2011</option>
	  <option value="2012">2012</option>
	  <option value="2013">2013</option>
	  <option value="2014" selected="selected">2014</option>
	  <option value="2015">2015</option>
	  <option value="2016">2016</option>
	  <option value="2017">2017</option>
	  <option value="2018">2018</option>
	  <option value="2019">2019</option>
	  <option value="2020">2020</option>
	</select>
</div>
<div>&nbsp;&nbsp;
	<input type="radio" name="quarter" value="1q" />1�б�&nbsp;
	<input type="radio" name="quarter" value="2q" />2�б�&nbsp;
	<input type="radio" name="quarter" value="3q" />3�б�&nbsp;
	<input type="radio" name="quarter" value="4q" />4�б�&nbsp;
	<input type="submit" value="��ȸ" class="btn" />&nbsp;
</div>
</form>

<div id="container" style="width: 600px; height: 400px; margin: 0 auto"></div>
<table id="datatable" style="display:none;">
	<thead>
		<tr>
			<th>ȸ���</th>
			<th>�� �����</th>
			<th>�� �ΰ���</th>
		</tr>
	</thead>
	
	<tbody>	
		<c:forEach var="outputlist" items="${outputlist}">
			<c:forEach var="partlist" items="${partlist}">
				<c:if test="${outputlist.code eq partlist.code}">
					<tr>
						<th>
							${outputlist.cname}
						</th>
						<td>${partlist.price/10000}</td>
						<td>${partlist.price*0.1/10000}</td>
						<%-- <td>
							<fmt:formatNumber value="${partlist.price}" type="currency"/>
						</td>
						<td>
							<fmt:formatNumber value="${partlist.price*0.1}" type="currency"/>
						</td> --%>
					</tr>
				</c:if>
			</c:forEach>		
		</c:forEach>
	</tbody>
</table>

<table width="550" border="1">



<c:if test="${param.code eq 'cname'}">
	<tr class="lv-bg">
		<td width="100">ȸ���</td>
		<td width="100">�� �����</td>
		<td width="100">�� �ΰ���</td>
	</tr>
	
	<c:forEach var="outputlist" items="${outputlist}">

		<c:forEach var="partlist" items="${partlist}">
			<c:if test="${outputlist.code eq partlist.code}">
				<tr>
					
					<td width="100">${outputlist.cname}</td>
					<td width="100">
						<fmt:formatNumber value="${partlist.price}" type="currency"/></td>
					<td width="100">
						<fmt:formatNumber value="${partlist.price*0.1}" type="currency"/></td>
				</tr>
			</c:if>
		</c:forEach>
		
	</c:forEach>
</c:if>


	<tr>
		<td>�Ѿ�</td>
		<td align="center">
			<fmt:formatNumber value="${totalPrice}" type="currency"/></td>
		<td align="center">
			<fmt:formatNumber value="${totalPrice*0.1}" type="currency"/></td>
	</tr>
</table>


</body>
</html>