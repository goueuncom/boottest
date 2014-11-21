<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<%@include file="inc/css_and_js.jsp" %>
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
		            text: '��ȸ'
		        },
		        yAxis: {
		            allowDecimals: false,
		            title: {
		                text: 'Ƚ��'
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
<%@include file="inc/pasdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

	<form method="post" action="/semi/semi.do">
   <input type="hidden" name="command" value="final-sal-search1" />
		<table style="border: 1px solid black">			
			<tr>
				<td>�����ȣ �˻� : </td>
				<td><input type="text" name="pcode" /></td>				
			</tr>
	
				<tr>
				<td colspan="2" align="center">
					<input class="b1"  type="submit" value="����"  />&nbsp;&nbsp;&nbsp;					
				</td> 	
			</tr>			
		</table>
	</form>
	
<br/>
 
<!-- <table width="550" border="1"> -->
<jsp:useBean id="stockdao" class="semi.StockDao"/>
<jsp:useBean id="stockdto" class="semi.StockDto"/>
<jsp:setProperty property="pcode" name="stockdto"/>
<%
stockdao.final_sal_search(stockdto);
%>
<!-- <tr class="lv-bg">		
		<td width="50">�����</td>
		<td width="50">�μ���ȣ</td>
		<td width="50">����</td>
		<td width="50">����</td>
		<td width="50">����</td>
		<td width="50">�����޿�</td>
		
	</tr> -->
	
<%
String pname = stockdto.getPname();
int pdes = stockdto.getPdes(), unpaid = stockdto.getUnpaid() , late = stockdto.getLate() , psa = stockdto.getPsa() ;
String posname = stockdto.getPosname();
%>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/modules/data.js"></script>

<div id="container" style="width: 310px; height: 400px; margin: 0 auto"></div>
<table id="datatable">
	<thead>
		<tr>
			<th></th>
			<th>�����ް�</th>
			<th>����</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>ȸ</th>
			<td><%=unpaid %></td>
			<td><%=late %></td>
		</tr>
	
	</tbody>
</table>
	</body>
</html>