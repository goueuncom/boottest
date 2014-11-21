<%@page contentType="text/html;charset=euc-kr" %>

 <%@include file="inc/111.jsp" %>
 <div class="container">
	<div class="row">
	<!-- 	<div class="span9">
			
		</div> -->
			<div>
				<h1 class="pull-left span1.5">재고 관리</h1>
			<ul class="span1.5 nav nav-list">
				<li class="nav-header add">상품 추가</li>
				<li class="divider"></li>
				<li><a href="add-list.jsp" class="addlist">리스트 추가</a></li>
				<li><a href="list-search.jsp" class="listsearch">리스트 조회</a></li>
			</ul>
			
			<ul class="span1.5 nav nav-list">	
				<li class="nav-header search">조회</li>
				<li class="divider"></li>
				<li><a href="input-search.jsp" class="inputsearch">입고조회</a></li>
				<li><a href="output-search.jsp" class="outputsearch">출고조회</a></li>
				<li><a href="stock-search.jsp" class="stocksearch">재고조회</a></li>
			</ul>
			
			<ul class="span1.5 nav nav-list">	
				<li class="nav-header allsearch">전체조회</li>
				<li class="divider"></li>
				<li><a href="input-all-search.jsp" class="inputallsearch">입고 전체 조회</a></li>
				<li><a href="output-all-search.jsp" class="outputallsearch">출고 전체 조회</a></li>
			</ul>
			
			<ul class="span1.5 nav nav-list">	
				<li class="nav-header put">입출고입력</li>
				<li class="divider"></li>
				<li><a href="input.jsp" class="input">입고 입력</a></li>
				<li><a href="output.jsp" class="output">출고 입력</a></li>
			</ul>
			
			<ul class="span1.5 nav nav-list">		
				<li class="nav-header pur">매입매출조회</li>
				<li class="divider"></li>
				<li><a href="" class="purchase">매입현황</a></li>
				<li><a href="" class="selling">매출현황</a></li>
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