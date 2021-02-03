<%@page import="master.DAO.StockRiceDAO"%>
<%@page import="master.utilities.ConnectionFactory"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	StockRiceDAO sdao=new StockRiceDAO();
	String rice_id=request.getParameter("rice_id");
	String bag=request.getParameter("bag");
	
	int flag=0;
	flag=sdao.CheckRiceId(rice_id, bag);
	
	if(flag==1)
	{
		RequestDispatcher rd=request.getRequestDispatcher("MahajanRiceAddServe");
		rd.forward(request, response);
	}
	else{
		request.setAttribute("error", "Bag doesn't exists");
		RequestDispatcher rd=request.getRequestDispatcher("StockForm2.jsp");
		rd.forward(request, response);
	}
%>
</body>
</html>