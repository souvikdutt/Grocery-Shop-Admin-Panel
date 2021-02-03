<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Log.css">
</head>
<body>
	<div class="main">
		<form class="box" action="CustomerAddCheck.jsp" method="post">
			<h1>CUSTOMER DETAILS</h1>
			<font color="red">Customer Id is already exist </font>
			<input type="text" name="cid" placeholder="Customer ID"> <input
				type="text" name="cname" placeholder="Customer Name">
			<input type="text" name="phno" placeholder="Phone Number">
			<input type="text" name="total_bill" placeholder="Total Bill" value="0">
			<input type="text" name="total_pay" placeholder="Total Pay" value="0">
			<input type="text" name="total_due" placeholder="Total Due" value="0">
			<input type="submit" value="SAVE">
		</form>
	</div>
</body>
</html>