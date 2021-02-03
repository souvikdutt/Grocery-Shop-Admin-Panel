<%@ page import="java.sql.*" %>
<%@page import="master.utilities.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Log.css">
</head>
<body>
	<div class="main">
		<form class="box" action="MdetailsOutput.jsp">
		<%
				ConnectionFactory obj=new ConnectionFactory();
				Connection cn=obj.getCon();
				
				Statement st=null;
				ResultSet rs=null;
				String select_mid ="select mid from mahajan_main";
				
				try{
					st=cn.createStatement();
					rs=st.executeQuery(select_mid);
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
			<input type="submit" value="PROCEED">
		</form>
	</div>

</body>
</html>