<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import = "java.sql.*" %> 
                <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->

<html>
<head>
<%@include file="inc/css_and_js.jsp" %>

  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
    	dateFormat:"yy/mm/dd"
    });
  });
  </script>
</head>
<body>
<%@include file="inc/asdf.jsp" %>
<%@include file="inc/buttoncss.jsp" %>


   <form method="post" action="/semi/semi.do">
   <input type="hidden" name="command" value="input" />
      <div style="border: 1px" >         
         <div>
            <div>�԰��Է�</div>
            <div>��ǰ�ڵ� : <input type="text" name="code" /></div>            
            <div>�԰��� : <input type="text" name="count" /></div>
            <div>�԰�¥ : <input type="text" id="datepicker" name="idate" /></div>
         </div>
   <hr/>         
            <div>               
               <input class="b1" type="submit" value="����" />               
            </div>               
      </div>
   </form>
   <table width="550" border="1">
   </table>
   
</body>
</html>