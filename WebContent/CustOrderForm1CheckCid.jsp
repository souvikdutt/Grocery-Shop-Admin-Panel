<%@page import="master.DAO.CustomerDAO"%>
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
	CustomerDAO cdao=new CustomerDAO();
	
	String cid=request.getParameter("cid");
	int flag=0;
	flag=cdao.CheckCid(cid);
	
	if(flag==0)
	{
		response.sendRedirect("CustOrderForm1Error.jsp");
	}
	else{
		RequestDispatcher rd=request.getRequestDispatcher("CustOrderForm2.jsp");
		rd.forward(request, response);
	}

%>

</body>
</html>