<%@page import="semi.DBConnectionMgr" %>
<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html >
<%@ page import="java.sql.*" %>
<%@ page import = "java.sql.*" %> 
                <!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->

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
            <div>상품 리스트 추가</div>
            <div>상품 코드 : <input type="text" name="code" /></div>
            <div>상품명 : <input type="text" name="name" /></div>
            <div>업체명 : <input type="text" name="com" /></div>
            <div>입고단가 : <input type="text" name="price" /></div>
            <div>출고단가 : <input type="text" name="sprice" /></div>
            <div>부서코드 : <input type="text" name="desc" /></div>
         </div>
   <hr/>
         
            <div>               
               <input class="b1" type="submit" value="전송" /> 
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