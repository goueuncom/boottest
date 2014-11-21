<%@page contentType="text/html;charset=euc-kr" %>
<style type="text/css">
.css1{
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #8de6d4) );
	background:-moz-linear-gradient( center top, #ffffff 5%, #8de6d4 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#8de6d4');
	background-color:#ffffff;

	text-indent:0px;
	border:0px solid #dcdcdc;
	display:inline-block;
	color:#91a2cc;
	font-family:arial;
	font-size:12px;
	font-weight:bold;
	font-style:normal;
	height:42px;
	line-height:42px;
	width:130px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
}
.css1:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #8de6d4), color-stop(1, #ffffff) );
	background:-moz-linear-gradient( center top, #8de6d4 5%, #ffffff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#8de6d4', endColorstr='#ffffff');
	background-color:#8de6d4;
}.css1:active {
	position:relative;
	top:1px;
}

</style>

  <script>
  $(function() {
    $( "#tabs" ).tabs({
    	event: "mouseover"
    });
  });
  </script>


<div id="tabs">
  <ul>
    <li><a href="#tabs-1">사원조회</a></li>
    <li><a href="#tabs-2">조회</a></li>
    <li><a href="#tabs-3">전체조회</a></li>
   <li><a href="#tabs-4">입출고입력</a></li>
  </ul>
  
	<div id="tabs-1">
	<div style="float: left">
	<form method="post" action="plist-search.jsp">
	<input class="css1" type="submit" value="사원조회" />
	</form>
	</div>
	
	<div>
	<form method="post" action="sal-search.jsp">
	<input class="css1" type="submit" value="급여조회" />
	</form>
	</div>
	
	</div>
	
	<div id="tabs-2">
		<div style="float: left">	
		<form method="post" action="des-sal-search.jsp">
		<!-- <input type="image" src="images/b.png" name="Submit" value="입고조회"> -->
		<input class="css1" type="submit" value="부서별 급여조회" />
		</form>
		</div>
	
	
		<div style="float: left">
		<form method="post" action="final-sal-search.jsp">
		<input class="css1" type="submit" value="최종급여 조회" />
		</form>
		</div>
	
		<div>
		<form method="post" action="Chart_test_final-sal-search.jsp">
		<input class="css1" type="submit" value="차트테스트" />
		</form>
		</div>
	</div>
	
	
	<div id="tabs-3">
		<div style="float: left">
		<form method="post" action="Copy of input.jsp">
		<input class="css1" type="submit" value="테스트!" />
		</form>
		</div>
	
		<div>
		<form method="post" action="output-all-search.jsp">
		<input class="css1" type="submit" value="출고 전체조회" />
		</form>
		</div>
	</div>
	
	<div id="tabs-4">
		<div style="float: left">	
		<form method="post" action="input.jsp">
		<input class="css1" type="submit" value="입고입력" />
		</form>
		</div>
		
		<div>
		<form method="post" action="output.jsp">
		<input class="css1" type="submit" value="출고입력" />
		</form>
		</div>
	</div>
	
</div>

<br/>
<hr/>