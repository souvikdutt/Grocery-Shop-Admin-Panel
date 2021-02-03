<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rice Entry</title>
<link rel="stylesheet" href="css/Log.css">
</head>
<body>
	<div class="main">
		<form class="box" action="RiceAddCheckRiceId.jsp" method="post" autocomplete="off">
			<h1>NEW RICE ENTRY</h1>
			<span style="color:red;font-size: 15px"><%=(request.getAttribute("error") == null) ? "" : request.getAttribute("error")%></span>
			
			<table>
				<tr>
					<td><label>Rice ID :</label></td>
					<td><input type="text" name="rice_id" placeholder="Rice ID"></td>
				</tr> 
				<tr>
					<td><label>Bag :</label></td>
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
					 <td><label>No. of Bag :</label></td>
					 <td><input type="text" name="nofbag" placeholder="Number of Bag"></td>
				 </tr>
				</table>	
				<input type="submit" value="SAVE">
					 	
			
		</form>
	</div>
</body>
</html>