<%@page import="semi.StockDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="inc/Chart_css_and_js.jsp" %>
<script>
$(function () {
    $('#container').highcharts({
        data: {
            table: document.getElementById('datatable')
        },
        chart: {
            type: 'column'
        },
        title: {
            text: '재고 현황'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: '갯수'
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                this.point.name.toLowerCase()  + ' ' +  this.point.y + '개';
            }
        }
    });
});


</script>
</head>
<body>

<!-- <div>

<form name="frm1" method="post" action="/semi/semi.do" >	
	<input type="hidden" name="command" value="test" />
</form>
</div> -->


<div id="container" style="width: 600px; height: 400px; margin: 0 auto"></div>
<table id="datatable">
   <thead>
      <tr style="border: 1px solid red;">
         <th>상품명</th>
         <th>재고</th>
      </tr>
   </thead>
	<tbody>
		<c:forEach var="i" items="${date}">
			<tr>								
				<td>${i.name}</td>
				<td>${i.count}</td>						
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>