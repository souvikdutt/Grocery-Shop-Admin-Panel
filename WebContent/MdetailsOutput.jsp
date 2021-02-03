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
					<td class="col">MAHAJAN ID</td>
					<td class="col">MAHAJAN NAME</td>
					<td class="col">TOTAL BILL</td>
					<td class="col">TOTAL PAYMENT</td>
					<td class="col">TOTAL DUES</td>
				</tr>
				<%	
					String mid=request.getParameter("mid");
	
					PreparedStatement ps=null;
					ResultSet rs=null;
					String select_mahajanMain="select * from mahajan_main where mid=?";
							
					ConnectionFactory obj=new ConnectionFactory();
					Connection cn=obj.getCon();
					
					try{
					ps=cn.prepareStatement(select_mahajanMain);
					ps.setString(1, mid);
					rs=ps.executeQuery();
					while(rs.next()){
				%>
					<tr>
					<td ><%=rs.getString(1)%></td>
					<td ><%=rs.getString(2) %></td>
					<td >&#8377;<%=rs.getString(3) %></td>
					<td >&#8377;<%=rs.getString(4) %></td>
					<td >&#8377;<%=rs.getString(5) %></td>
					</tr>
				<% } 
					}
				catch(SQLException se){
					se.printStackTrace();
					}%>
			</table>	
			<br><br><br>
			<a href="WelcomeMahajan.jsp">Go To Home</a>
			</center>
		</div>
	</div>
</body>
</html>