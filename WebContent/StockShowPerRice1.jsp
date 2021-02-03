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
					<td class="col">RICE ID</td>
					<td class="col">BAG(1/5/10/25/50/60)KG</td>
					<td class="col">NO OF BAG</td>
				</tr>
				<%	
					String rice_id=request.getParameter("rice_id");	
				
					PreparedStatement ps=null;
					ResultSet rs=null;
					String select_stockRice="select * from stock_rice where rice_id=?";
					
					ConnectionFactory obj=new ConnectionFactory();
					Connection cn=obj.getCon();
					
					try{
					ps=cn.prepareStatement(select_stockRice);
					ps.setString(1, rice_id);
					rs=ps.executeQuery();
					while(rs.next()){
				%>
					<tr>
					<td ><%=rs.getString(1)%></td>
					<td ><%=rs.getString(2) %>kg</td>
					<td ><%=rs.getString(3) %></td>
					</tr>
				<% } 
					}
				catch(SQLException se){
					se.printStackTrace();
					}%>
			</table>	
			<br><br><br>
			<a href="WelcomeStcok.jsp">Go To Home</a>
			</center>
		</div>
	</div>
</body>
</html>