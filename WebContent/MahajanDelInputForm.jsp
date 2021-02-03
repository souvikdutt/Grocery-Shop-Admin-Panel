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
		<form class="box" action="MahajanDelServe" method="post">
			<input type="date" class="date" name="sdate" placeholder="Date">
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
			 <input	type="submit" value="DELETE">
		</form>
	</div>
</body>
</html>