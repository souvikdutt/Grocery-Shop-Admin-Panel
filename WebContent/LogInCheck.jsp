
<%@page import="master.utilities.ConnectionFactory"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String gmail=request.getParameter("gmail");
	String pass=request.getParameter("pass");
	int flag=0;
	
	ConnectionFactory obj=new ConnectionFactory();
	Connection cn=obj.getCon();
	Statement st=null;
	ResultSet rs=null;
	String select_sql="select gmail,password from admin_signup";
	try{
		st=cn.createStatement();
		rs=st.executeQuery(select_sql);
		while(rs.next())
		{
			if((rs.getString(1).equals(gmail)) && (rs.getString(2).equals(pass))){
				flag=1;
				response.sendRedirect("Home.jsp");
			}
		}
	}catch(SQLException se){
		se.printStackTrace();
	}
	if(flag==0){
		request.setAttribute("error", "You've entered wrong username/password");
		RequestDispatcher rd = request.getRequestDispatcher("LogIn.jsp");
		rd.forward(request, response);
	}
%>
</body>
</html>