<%@page import="semi.StockDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
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
            text: '������ ��Ȳ'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: '������ ����'
            }
        },
        tooltip: {
            formatter: function () {
            	return '<b>' + this.series.name + '</b><br/>' +
                this.point.name.toLowerCase()  + ' ' +  this.point.y + '��';
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
      <tr>
         <th>��ǰ��</th>
         <th>����</th>
         <th>����</th>
      </tr>
   </thead>
<%
 	Vector vAddr = (Vector)request.getAttribute("chart");
 	Vector vAddr1 = (Vector)request.getAttribute("chart1");
	StockDto dto; 
	StockDto dto1; 
try{
	if(vAddr.size() == 0 || vAddr == null){
%>
	<tr><td>�˻� ����� �����ϴ�.</td></tr>
<%
	}
	else{

		for(int i = 0 ; i<vAddr.size();i++){
			dto = (StockDto)vAddr.get(i);	
			dto1 = (StockDto)vAddr1.get(i);	
%>
   <tbody>
			<tr>								
				<td><%=dto.getName()%></td>
				<td><%=dto.getAll_I_Count()%></td>
				<td><%=dto1.getAll_O_Count()%></td>				
			</tr>
   </tbody>
<%
				
		}//for
	}//else
}//try
catch(NullPointerException err){}
%>
</table>

</body>
</html>