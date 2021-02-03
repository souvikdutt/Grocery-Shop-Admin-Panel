<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Log.css">
<script type="text/javascript">
		
		function totalweight() {
			
			var bagkg=document.getElementById("bagkg").value;
			var nofbag=document.getElementById("nofbag").value;
			
			var weight=bagkg*nofbag;
			var quinweight=weight/100;
			document.getElementById("totalWeight").value=quinweight;
			
		}
		
		function priceCal() {
			
			var totalweight=document.getElementById("totalWeight").value;
			var rate_quin=document.getElementById("rate_quin").value;
			
			var pri=totalweight*rate_quin;
			document.getElementById("price").value=pri;
		}
	
</script>
</head>
<body>
	<div class="main">
		<form class="box"  action="CustOrderForm2CheckRiceId.jsp" method="post">
		<%
			String cdate=request.getParameter("cdate");
			String cid=request.getParameter("cid");
		%>
			<input type="text" name="cdate" value="<%=cdate %>">
			<input type="text" name="cid" value="<%=cid %>">
			<input type="text" name="rice_id" placeholder="Rice ID">
			<input type="text" name="bag" placeholder="Bag" id="bagkg">
			<input type="text" name="nofbag" placeholder="No Of Bags" id="nofbag">
			<input type="text" name="total_weight" placeholder="Total weight" id="totalWeight" onclick="totalweight();">
			<input type="text" name="rate_quin" placeholder="Rate/quintal" id="rate_quin">
			<input type="text" name="price" placeholder="price" id="price" onclick="priceCal();">   
			<input	type="submit" value="ADD"> 
		</form>
		
		<form class="box2" action="CustOrderForm3.jsp" method="post">
			<input type="text" name="cdate" value="<%=cdate %>">
			<input type="text" name="cid" value="<%=cid %>">
			<input	type="submit" value="BILL INSERT"> 
		</form>
		
	</div>
</body>
</html>