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
	            text: '부가세'
	        },
	        yAxis: {
	            allowDecimals: false,
	            title: {
	                text: '단위:만원'
	            }
	        },
	        tooltip: {
	            formatter: function () {
	                return '<b>' + this.series.name + '</b><br/>' +
	                this.point.name.toLowerCase()  + ' ' +  this.point.y + '만원';
	            }
	        }
	    });
	});
  

  
</script> 

</head>
<body>


<form method="post" action="/semi/semi.do">
<input type="hidden" name="command" value="Tax-input-search" />
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
	<input type="radio" name="quarter" value="1q" />1분기&nbsp;
	<input type="radio" name="quarter" value="2q" />2분기&nbsp;
	<input type="radio" name="quarter" value="3q" />3분기&nbsp;
	<input type="radio" name="quarter" value="4q" />4분기&nbsp;
	<input type="submit" value="조회" class="btn" />&nbsp;
</div>
</form>

<div id="container" style="width: 600px; height: 400px; margin: 0 auto"></div>
<table id="datatable" style="display:none;">
	<thead>
		<tr>
			<th>회사명</th>
			<th>총 입고액</th>
			<th>총 부가세</th>
		</tr>
	</thead>
	
	<tbody>	
		<c:forEach var="inputlist" items="${inputlist}">
			<c:forEach var="partlist" items="${partlist}">
				<c:if test="${inputlist.code eq partlist.code}">
					<tr>
						<th>
							${inputlist.cname}
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
		<td width="100">회사명</td>
		<td width="100">총 입고액</td>
		<td width="100">총 부가세</td>
	</tr>
	
	<c:forEach var="inputlist" items="${inputlist}">

		<c:forEach var="partlist" items="${partlist}">
			<c:if test="${inputlist.code eq partlist.code}">
				<tr>
					
					<td width="100">${inputlist.cname}</td>
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
		<td>총액</td>
		<td align="center">
			<fmt:formatNumber value="${totalPrice}" type="currency"/></td>
		<td align="center">
			<fmt:formatNumber value="${totalPrice*0.1}" type="currency"/></td>
	</tr>
</table>


</body>
</html>