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
		<form class="box" action="ExPaymentCustCheckCid.jsp" method="post">
			<input type="text" name="cdate" placeholder="Date">
			<input type="text" name="cid" placeholder="Customer ID">
			<input type="text" name="total_bill" placeholder="Total Bill" value="0">
			<input type="text" name="payment" placeholder="Payment of Customer">
			<input type="text" name="due" placeholder="Due" value="0">   
			<input	type="submit" value="SUBMIT AND EXIT"> 
		</form>
</body>
</html>