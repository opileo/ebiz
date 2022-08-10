<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="dbManagement.DBUtil" %>
 <%@ page import="java.sql.*" %>
 
 <%
 	Connection dbconnection= null;
	Statement statement = null;
	ResultSet rs = null;
	
//	database connection details
	String url = "jdbc:mysql://localhost:3306/ebiz";
	String username = "root";
	String password = "";
	
//	database provider type
	String dbProvider = "com.mysql.cj.jdbc.Driver";
	try{
		Class.forName(dbProvider);
		dbconnection = DriverManager.getConnection(url,username,password);
	}catch(Exception e){}
	dbconnection = DriverManager.getConnection(url,username,password);
	statement = dbconnection.createStatement();
	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<!-- bootstrap link-->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
</head>
<body>
	<div class="container">
		<h1 class="text-primary text-center">Employee Details</h1>
		<div>
			<table class="table">
				<tr>
						<th>Name</th>
						<th>Email</th>
						<th>role</th>
						<th>Action</th>
				</tr>
				<% 
					DBUtil dbutil = new DBUtil();
					String sql = "select * from employee";
					rs = statement.executeQuery(sql);

					while(rs.next()){
						int id = rs.getInt("id");
						String name = rs.getString("username");
						String email = rs.getString("email");
						String role = rs.getString("role");
				%>
				
				<tr>
					<td><%=name %></td>
					<td><%=email %></td>
					<td><%=role %></td>
					<td>
						<a href="add_employee.jsp?id=<%=id %>" class="btn btn-primary">Edit</a>
						<a href="../../DeleteEmployee?id=<%=id %>" class="btn btn-danger">Delete</a>
					</td>
				</tr>
				<%
					}
					
				%>
			</table>
		</div>
	</div>
</body>
</html>