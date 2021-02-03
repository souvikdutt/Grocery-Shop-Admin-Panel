<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel="stylesheet" href="css/Log.css">
</head>
<body>
	<div class="main">
        <form class="box" action="LogInCheck.jsp" method="post">
            <h1>Log In</h1>
            <input type="text" name="gmail" placeholder="gmail">
            <input type="password" name="pass" placeholder="password">
            <span style="color:red;font-size: 10px"><%=(request.getAttribute("error") == null) ? "" : request.getAttribute("error")%></span>
            <input type="submit"  placeholder="Login" value="Login">
            <a href="SignUp.jsp"><font color="red">Create Account</font></a>
        </form>
     </div>
</body>
</html>