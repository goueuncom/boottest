<%@page contentType="text/html;charset=euc-kr" %>

 <%@include file="inc/111.jsp" %>
 <div class="container">
	<div class="row">
	<!-- 	<div class="span9">
			
		</div> -->
			<div>
				<h1 class="pull-left span1.5">��� ����</h1>
			<ul class="span1.5 nav nav-list">
				<li class="nav-header add">��ǰ �߰�</li>
				<li class="divider"></li>
				<li><a href="add-list.jsp" class="addlist">����Ʈ �߰�</a></li>
				<li><a href="list-search.jsp" class="listsearch">����Ʈ ��ȸ</a></li>
			</ul>
			
			<ul class="span1.5 nav nav-list">	
				<li class="nav-header search">��ȸ</li>
				<li class="divider"></li>
				<li><a href="input-search.jsp" class="inputsearch">�԰���ȸ</a></li>
				<li><a href="output-search.jsp" class="outputsearch">�����ȸ</a></li>
				<li><a href="stock-search.jsp" class="stocksearch">�����ȸ</a></li>
			</ul>
			
			<ul class="span1.5 nav nav-list">	
				<li class="nav-header allsearch">��ü��ȸ</li>
				<li class="divider"></li>
				<li><a href="input-all-search.jsp" class="inputallsearch">�԰� ��ü ��ȸ</a></li>
				<li><a href="output-all-search.jsp" class="outputallsearch">��� ��ü ��ȸ</a></li>
			</ul>
			
			<ul class="span1.5 nav nav-list">	
				<li class="nav-header put">������Է�</li>
				<li class="divider"></li>
				<li><a href="input.jsp" class="input">�԰� �Է�</a></li>
				<li><a href="output.jsp" class="output">��� �Է�</a></li>
			</ul>
			
			<ul class="span1.5 nav nav-list">		
				<li class="nav-header pur">���Ը�����ȸ</li>
				<li class="divider"></li>
				<li><a href="" class="purchase">������Ȳ</a></li>
				<li><a href="" class="selling">������Ȳ</a></li>
			</ul>
		</div>
	</div>
</div>
<script>
 $(document).ready(
		function(){
			$(".add").css("font-weight","bold").css("color","white").css("font-size","17px");
			$(".search").css("font-weight","bold").css("color","white").css("font-size","17px");
			$(".allsearch").css("font-weight","bold").css("color","white").css("font-size","17px");
			$(".put").css("font-weight","bold").css("color","white").css("font-size","17px");
			$(".pur").css("font-weight","bold").css("color","white").css("font-size","17px");
	
		}		
	); 
</script>