<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>

<%
int unpaid = 10 , late = 5 , psa = 5;
%>
<% String test = ", {name: '�̰���',data: ["+unpaid+", 38.8]},"; %>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
${demo.css}
		</style>
		<script type="text/javascript">

		$(function () {
		    $('#container').highcharts({
		        data: {
		            table: document.getElementById('datatable')
		        },
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: 'Data extracted from a HTML table in the page'
		        },
		        yAxis: {
		            allowDecimals: false,
		            title: {
		                text: 'Units'
		            }
		        },
		        tooltip: {
		            formatter: function () {
		                return '<b>' + this.series.name + '</b><br/>' +
		                    this.point.y + ' ' + this.point.name.toLowerCase();
		            }
		        }
		    });
		});
		</script>
	</head>
	<body>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/modules/data.js"></script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

<table id="datatable">
	<thead>
		<tr>
			<th></th>
			<th>Jane</th>
			<th>John</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>Apples</th>
			<td><%=unpaid %></td>
			<td>4</td>
		</tr>
	
	</tbody>
</table>
	</body>
</html>
