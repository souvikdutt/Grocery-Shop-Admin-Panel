<%@page import="master.DAO.StockRiceDAO"%>
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
		request.setAttribute("error", "Rice ID & Bag already exists.");
		RequestDispatcher rd=request.getRequestDispatcher("RiceAdd.jsp");
		rd.forward(request, response);
	}
	else{
		RequestDispatcher rd=request.getRequestDispatcher("RiceAddServe");
		rd.forward(request, response);
	}
%>
</body>
</html>