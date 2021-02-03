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
					<td class="col">DATE</td>
					<td class="col">CUSTOMER ID</td>
					<td class="col">RICE ID</td>
					<td class="col">BAG(1/5/10/25/50/60)KG</td>
					<td class="col">NO OF BAGS</td>
					<td class="col">TOTAL WEIGHT</td>
					<td class="col">RATE/QUINTAL</td>
					<td class="col">PRICE</td>
				</tr>
				<%	
					String cdate=request.getParameter("cdate");
					String cid=request.getParameter("cid");
	
					PreparedStatement ps=null;
					ResultSet rs=null;
					String select_custRice="select * from cust_rice where cdate=? and cid=? ";
					String select_custBill="select * from cust_bill where cdate=? and cid=?";
							
					ConnectionFactory obj=new ConnectionFactory();
					Connection cn=obj.getCon();
					
					try{
					ps=cn.prepareStatement(select_custRice);
					ps.setString(1, cdate);
					ps.setString(2, cid);
					rs=ps.executeQuery();
					while(rs.next()){
				%>
					<tr>
					<td ><%=rs.getString(1)%></td>
					<td ><%=rs.getString(2) %></td>
					<td ><%=rs.getString(3) %></td>
					<td ><%=rs.getString(4) %>KG</td>
					<td ><%=rs.getString(5) %></td>
					<td ><%=rs.getString(6) %></td>
					<td ><%=rs.getString(7) %></td>
					<td ><%=rs.getString(8) %></td>
					</tr>
				<% } 
					}
				catch(SQLException se){
					se.printStackTrace();
					}%>
			</table>
			<table>
				<tr>
					<td class="col">DATE</td>
					<td class="col">CUSTOMER ID</td>
					<td class="col">TOTAL BILL(TO DATE)</td>
					<td class="col">PAYMENT(TO DATE)</td>
					<td class="col">DUES(TO DATE)</td>
				</tr>
				<%	
					try{
					ps=cn.prepareStatement(select_custBill);
					ps.setString(1, cdate);
					ps.setString(2, cid);
					rs=ps.executeQuery();
					while(rs.next()){
				%>
					<tr>
					<td ><%=rs.getString(1)%></td>
					<td ><%=rs.getString(2) %></td>
					<td ><%=rs.getString(3) %></td>
					<td ><%=rs.getString(4) %></td>
					<td ><%=rs.getString(5) %></td>
					</tr>
				<% } 
					}
				catch(SQLException se){
					se.printStackTrace();
					}%>
			</table>
			<a href="WelcomeDueCust.jsp">click Home</a>
			</center>
		</div>
	</div>
</body>
</html>