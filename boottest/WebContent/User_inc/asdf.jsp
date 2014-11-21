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
    
    <li><a href="#tabs-2">��ȸ</a></li>
    <li><a href="#tabs-3">��ü��ȸ</a></li>
   <li><a href="#tabs-4">������Է�</a></li>
   <li><a href="#tabs-5">���Ը�����ȸ</a></li>
  </ul>

	
	<div id="tabs-2">
		<div style="float: left">	
		<form method="post" action="input-search.jsp">
		<!-- <input type="image" src="images/b.png" name="Submit" value="�԰���ȸ"> -->
		<input class="css1" type="submit" value="�԰���ȸ" />
		</form>
		</div>
	
	
		<div style="float: left">
			<form method="post" action="output-search.jsp">
			<input class="css1" type="submit" value="�����ȸ" />
		</form>
		</div>
	
		<div style="float: left">
			<form method="post" action="stock-search.jsp">
			<input class="css1" type="submit" value="�����ȸ" />
		</form>
		</div>
		
		<div>
			<form method="post" action="select1.jsp">
			<input class="css1" type="submit" value="�Ⱓ��ȸ" />
		</form>
		</div>
	</div>
	
	
	<div id="tabs-3">
		<div style="float: left">
		<form method="post" action="input-all-search.jsp">
		<input class="css1" type="submit" value="�԰� ��ü��ȸ" />
		</form>
		</div>
	
		<div>
		<form method="post" action="output-all-search.jsp">
		<input class="css1" type="submit" value="��� ��ü��ȸ" />
		</form>
		</div>
	</div>
	
	<div id="tabs-4">
		<div style="float: left">	
		<form method="post" action="input.jsp">
		<input class="css1" type="submit" value="�԰��Է�" />
		</form>
		</div>
		
		<div>
		<form method="post" action="output.jsp">
		<input class="css1" type="submit" value="����Է�" />
		</form>
		</div>
	</div>
	
	<div id="tabs-5">
		<div style="float: left">	
		<form method="post" action="total-input-search.jsp">
		<input class="css1" type="submit" value="������Ȳ" />
		</form>
		</div>
		
		<div>
		<form method="post" action="total-output-search.jsp">
		<input class="css1" type="submit" value="������Ȳ" />
		</form>
		</div>
	</div>
	
</div>

<br/>
<hr/>