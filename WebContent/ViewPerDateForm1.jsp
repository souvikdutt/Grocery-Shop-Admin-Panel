<%@page import="master.DAO.MahajanDAO"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>Form1</title>
<link rel="stylesheet" href="css/Log.css">
</head>
<body>
	<div class="main">
		<form class="box" action="ShowPerDate.jsp" >
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
			 <input	type="submit" value="PROCEED">
		</form>
	</div>
</body>
</html>