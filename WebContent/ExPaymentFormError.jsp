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
		<form class="box" action="ExpaymentCheckMID.jsp" method="post">
		<font color="red" size="3">Mahajan Id is not exist</font>
			<input type="text" name="sdate" placeholder="Date">
			<input type="text" name="mid" placeholder="Mahajan ID">
			<input type="text" name="total_bill" placeholder="Total Bill" value="0">
			<input type="text" name="payment" placeholder="Payment To Mahajan">
			<input type="text" name="due" placeholder="Due" value="0">   
			<input	type="submit" value="SUBMIT AND EXIT"> 
		</form>
</body>
</html>