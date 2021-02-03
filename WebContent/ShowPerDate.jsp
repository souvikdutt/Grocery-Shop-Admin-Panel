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
					<td class="col">MAHAJAN ID</td>
					<td class="col">RICE ID</td>
					<td class="col">BAG(1/5/10/25/50/60)KG</td>
					<td class="col">NO OF BAGS</td>
					<td class="col">PRICE</td>
				</tr>
				<%	
					String sdate=request.getParameter("sdate");
					String mid=request.getParameter("mid");
	
					PreparedStatement ps=null;
					ResultSet rs=null;
					String select_mahajanRice="select * from mahajan_rice where sdate=? and mid=? ";
					String select_mahajanBilling="select * from mahajan_billing where sdate=? and mid=?";
							
					ConnectionFactory obj=new ConnectionFactory();
					Connection cn=obj.getCon();
					
					try{
					ps=cn.prepareStatement(select_mahajanRice);
					ps.setString(1, sdate);
					ps.setString(2, mid);
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
					<td class="col">MAHAJAN ID</td>
					<td class="col">TOTAL BILL(TO DATE)</td>
					<td class="col">PAYMENT(TO DATE)</td>
					<td class="col">DUES(TO DATE)</td>
				</tr>
				<%	
					try{
					ps=cn.prepareStatement(select_mahajanBilling);
					ps.setString(1, sdate);
					ps.setString(2, mid);
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
			<a href="MahajanDelInputForm.jsp"><input class="mahajan_button" type="button" value="DELETE"></a>
			
			<a href="WelcomeMahajan.jsp">click Home</a>
			</center>
		</div>
	</div>
</body>
</html>