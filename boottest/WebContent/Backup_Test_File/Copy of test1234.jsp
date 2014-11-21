<%@page import="semi.StockDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/modules/data.js"></script>
 -->
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/modules/data.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" type="text/css" href="css/table.css">
 <script>
  $(function() {
	    $( "#from" ).datepicker({
	      defaultDate: "+1w",
	      changeMonth: true,
	      changeYear: true,
	      numberOfMonths: 1,
	      dateFormat:"yy/mm/dd",	      
	      onClose: function( selectedDate ) {
	        $( "#to" ).datepicker( "option", "minDate", selectedDate );
	      }
	    });
	    $( "#to" ).datepicker({
	      defaultDate: "+1w",
	      changeMonth: true,
	      changeYear: true,
	      numberOfMonths: 1,
	      dateFormat:"yy/mm/dd",
	      onClose: function( selectedDate ) {
	        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
	      }
	    });
	  });
 </script>

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
            allowDecimals: true,
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

<div>

   <form method="post" action="/semi/semi.do">
   <input type="hidden" name="command" value="dateTest" />
      <div style="border: 1px" >         
         <div>
            <div>�԰�¥ ��ȸ</div>
            <div>�԰�¥ : <input type="text" id="from" name="idate" />-
          <input type="text" id="to" name="idate1" /></div>
         </div>
   <hr/>         
            <div>               
               <input class="b1" type="submit" value="����" />               
            </div>               
      </div>
   </form>
</div>


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
 	Vector vAddr = (Vector)request.getAttribute("date");

	StockDto dto; 

try{
	if(vAddr.size() == 0 || vAddr == null){
%>
	<tr><td>�˻� ����� �����ϴ�.</td></tr>
<%
	}
	else{

		for(int i = 0 ; i<vAddr.size();i++){
			dto = (StockDto)vAddr.get(i);	

%>
   <tbody>
			<tr>								
				<td><%=dto.getName()%></td>
				<td><%=dto.getCount()%></td>
			
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