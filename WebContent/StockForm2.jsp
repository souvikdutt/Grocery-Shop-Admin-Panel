<%@page import="master.DAO.StockRiceDAO"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>Login Page</title>
<link rel="stylesheet" href="css/Log.css">
</head>
<body>
	<div class="main">
		<form class="box"  action="StockForm2CheckRice_Id.jsp" method="post" autocomplete="off">
		<%
			String sdate=request.getParameter("sdate");
			String mid=request.getParameter("mid");
		%>
		<span style="color:red;font-size: 15px"><%=(request.getAttribute("error") == null) ? "" : request.getAttribute("error")%></span>
		
		<table>
				<tr>
					<td><span>Date :</span></td>
					<td><input type="text" name="sdate" value="<%=sdate %>"></td>
				</tr>
				<tr>
					<td><span>Mahajan ID :</span></td>
					<td><input type="text" name="mid" value="<%=mid %>"></td>
				</tr>
				<tr>
					<td><span>Rice ID :</span></td>
					<td><%
						ResultSet rs = null;
						StockRiceDAO obj = new StockRiceDAO();
						try{
							rs = obj.getRiceId();
							%>
							<select id="rice_id" name="rice_id"><%
							while(rs.next()){
							%>
						          <option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
							<%}%> </select><%
							}
							catch(SQLException se){
								se.printStackTrace();
							}
					%>
					</td>
				</tr>
				<tr>
					<td><span>Bag(Weight) :</span></td>
					<td><select id="weightOfbag" name="bag">
				          <option value="1">1 KG</option>
				          <option value="5">5 KG</option>
				          <option value="10">10 KG</option>
				          <option value="25">25 KG</option>
				          <option value="50">50 KG</option>
				          <option value="60">60 KG</option>
				        </select>
				      </td>
				</tr>
				<tr>
					<td><span>No. of Bag :</span></td>
					<td><input type="text" name="nofbag" placeholder="No Of Bags"></td>
				</tr>
				<tr>
					<td><span>Price :</span></td>
					<td><input type="text" name="price" placeholder="price"></td>
				</tr>
			</table>
			<input	type="submit" value="ADD"> 
		</form>
		
		<form class="box2" action="StockForm3.jsp" method="post">
			<input type="text" name="sdate" value="<%=sdate %>">
			<input type="text" name="mid" value="<%=mid %>">
			<input	type="submit" value="BILL INSERT"> 
		</form>
		
	</div>
</body>
</html>