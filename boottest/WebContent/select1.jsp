<%@page contentType="text/html;charset=euc-kr" %>
<%@page import="semi.StockDto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html >
<html>
<head>
<title>Insert title here</title>

<%@include file="inc/css_and_js.jsp" %>

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
		    
	    
	  }); //�ݼ� ��

  </script>
</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>

<form method="post" action="/semi/semi.do">
   <input type="hidden" name="command" value="SelectDate" />
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

<div id="container" style="width: 600px; height: 400px; margin: 0 auto"></div>
<table id="datatable">
   <thead>
      <tr style="border: 1px solid red;">
         <th>��ǰ��</th>
         <th>���</th>
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
%>

<tbody>
<%
		for(int i = 0 ; i<vAddr.size();i++){
			dto = (StockDto)vAddr.get(i);	
			
%>
			<tr>								
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