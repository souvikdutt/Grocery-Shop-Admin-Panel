<%@page import="master.DAO.MahajanDAO"%>
<%@ page import="java.sql.*" %>
<%@page import="master.utilities.ConnectionFactory"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>Form1</title>
<link rel="stylesheet" href="css/Log.css">
</head>
<body>
	<div class="main">
		<form class="box" action="StockForm2.jsp" method="post">
			<input class="date" type="date" name="sdate" placeholder="Date">
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
			 <input	type="submit" value="PROCEED">
		</form>
	</div>
</body>
</html>