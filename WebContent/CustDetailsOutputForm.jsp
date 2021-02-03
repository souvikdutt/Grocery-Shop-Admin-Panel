<%@page import="master.utilities.ConnectionFactory"%>
<%@ page import="java.sql.*" %>
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
	<div class="main1">
		<div class="box3" >
		<center>
			<table>
				<tr>
					<td class="col">CUSTOMER ID</td>
					<td class="col">CUSTOMER NAME</td>
					<td class="col">PHONE NUMBER</td>
					<td class="col">TOTAL BILL</td>
					<td class="col">TOTAL PAYMENT</td>
					<td class="col">TOTAL DUES</td>
				</tr>
				<%	
					String cid=request.getParameter("cid");
	
					PreparedStatement ps=null;
					ResultSet rs=null;
					String select_custMain="select * from cust_main where cid=?";
					
					ConnectionFactory obj=new ConnectionFactory();
					Connection cn=obj.getCon();
					
					try{
					ps=cn.prepareStatement(select_custMain);
					ps.setString(1, cid);
					rs=ps.executeQuery();
					while(rs.next()){
				%>
					<tr>
					<td ><%=rs.getString(1)%></td>
					<td ><%=rs.getString(2) %></td>
					<td ><%=rs.getString(3) %></td>
					<td >$<%=rs.getString(4) %></td>
					<td >$<%=rs.getString(5) %></td>
					<td >$<%=rs.getString(6) %></td>
					</tr>
				<% } 
					}
				catch(SQLException se){
					se.printStackTrace();
					}%>
			</table>	
			<br><br><br>
			<a href="WelcomeDueCust.jsp">Go To Home</a>
			</center>
		</div>
	</div>
</body>
</html>