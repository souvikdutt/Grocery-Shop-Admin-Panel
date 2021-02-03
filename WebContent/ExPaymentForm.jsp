<%@page import="master.DAO.MahajanDAO"%>
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
<div class="main">
		<form class="box" action="ExpaymentCheckMID.jsp" method="post">
			<table>
			<tr>
				<td><span>Date :</span></td>
				<td><input class="date" type="date" name="sdate"></td>
			</tr>
			<tr>
				<td><span>Mahajan ID :</span></td>
				<td>
					<%
				MahajanDAO obj = new MahajanDAO();
				ResultSet rs=null;
				
				try{
					rs=obj.getMid();
					%>
					<select id="rice_id" name="mid"><%
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
				<td><span>Total Amount :</span></td>
				<td><input type="text" name="total_bill" id="total_bill" value="0"></td>
			</tr>
			<tr>
				<td><span>Payment of :</span></td>
				<td><input type="text" name="payment" placeholder="Payment To Mahajan" id="payment"></td>
			</tr>
			<tr>
				<td><span>Remain Due :</span></td>
				<td><input type="text" name="due" placeholder="Due" value="0"></td>
			</tr>
		</table> 
			<input	type="submit" value="SUBMIT AND EXIT"> 
		</form>
</body>
</html>