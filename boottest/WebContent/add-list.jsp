<%@page import="semi.DBConnectionMgr" %>
<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.*" %>
<%@ page import = "java.sql.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<%@include file="inc/css_and_js.jsp" %>
</head>

<body>
<%@include file="inc/111.jsp" %> 
<%@include file="inc/buttoncss.jsp" %>

   <form method="post" action="/semi/semi.do">
   <input type="hidden" name="command" value="add-list" />
      <div style="border: 1px" >         
         <div>
            <div>��ǰ ����Ʈ �߰�</div>
            <div>��ǰ �ڵ� : <input type="text" name="code" /></div>
            <div>��ǰ�� : <input type="text" name="name" /></div>
            <div>��ü�� : <input type="text" name="com" /></div>
            <div>�԰�ܰ� : <input type="text" name="price" /></div>
            <div>���ܰ� : <input type="text" name="sprice" /></div>
            <div>�μ��ڵ� : <input type="text" name="desc" /></div>
         </div>
   <hr/>
         
            <div>               
               <input class="b1" type="submit" value="����" /> 
               <input class="b1" type="reset" value="reset" />              
            </div>           
      </div>
   </form>


<table width="550" border="1">

</table>
</body>
<script>
$(document).ready(
		function(){
			$(".addlist").css("color","red");
		}		
	);
</script>
</html>