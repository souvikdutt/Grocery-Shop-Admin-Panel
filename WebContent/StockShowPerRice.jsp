<%@page import="master.DAO.StockRiceDAO"%>
<%@ page import="java.sql.*" %>
<%@page import="master.utilities.ConnectionFactory"%>
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
		<form class="box" action="StockShowPerRice1.jsp" method="post">
					
					<%
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
					
			<input type="submit" value="PROCEED">
		</form>
	</div>
</body>
</html>