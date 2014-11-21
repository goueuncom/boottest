<%@ page contentType="text/html; charset=euc-kr"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="js/scripts.js"></script>

</head>
<body>

<div class="page-container">
<h1>Login</h1>
   <form method="post" action="/semi/semi.do">
   <input type="hidden" name="command" value="login" />
      <div style="border: 1px" >         
         <div>
            
            <div><input type="text" name="pcode" class="username" placeholder="사원번호"/></div>            

         </div>
     
            <div>               
               <button type="submit">Login!</button>              
            </div>               
      </div>
   </form>
</div>
</body>
</html>