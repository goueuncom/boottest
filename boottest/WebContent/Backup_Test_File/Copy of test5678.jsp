<%@page import="semi.StockDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/modules/data.js"></script>
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
            text: '��� ��Ȳ'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: '����'
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
      <tr style="border: 1px solid red;">
         <th>��ǰ��</th>
         <th>���</th>
      </tr>
   </thead>
<%
 	Vector vAddr = (Vector)request.getAttribute("stockchart");
 	
	StockDto dto; 
	
try{
	if(vAddr.size() == 0 || vAddr == null){
%>
	<tr><td>�˻� ����� �����ϴ�.</td></tr>
<%
	}
	else{
%>

<tbody>
<%
		for(int i = 0 ; i<vAddr.size();i++){
			dto = (StockDto)vAddr.get(i);	
			
%>
			<tr style="">								
				<th><%=dto.getName()%></th>
				<td><%=dto.getCount()%></td>						
			</tr>
<%
				
		}//for
%>
   </tbody>
</table>
<%
	}//else
}//try
catch(NullPointerException err){}
%>

</body>
</html>