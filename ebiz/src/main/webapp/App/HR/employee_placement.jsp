<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="dbManagement.DBUtil" %>
 <%@ page import="java.sql.*" %>
 
 <%
 	Connection dbconnection= null;
	Statement statement = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	
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
		<h1 class="text-primary text-center">Employee Placement Details</h1>
		<a href="../../Generate" class="btn btn-success">Generate</a>
		<br>
		<div>
		<br><br>
		<h1 class="">Short term line</h1>
			<table style="" class="table">
				<tr>
						<th>Name</th>
						<th>Email</th>
						<th>role</th>
						<th>Action</th>
				</tr>
				<% 
					
					String sql1 = "select email,username,role from employee e inner join workers_allocations wa on e.id = wa.employee_id where product_category ='short term'";
					rs1 = statement.executeQuery(sql1);

					while(rs1.next()){
						String name = rs1.getString("username");
						String email = rs1.getString("email");
						String role = rs1.getString("role");
				%>
				
				<tr>
					<td><%=name %></td>
					<td><%=email %></td>
					<td><%=role %></td>
					<td>
						<a href="add_prodct.jsp" class="btn btn-primary">Edit</a>
						<a href="add_prodct.jsp" class="btn btn-danger">Delete</a>
					</td>
				</tr>
				<%
					}
					
				%>
			</table>
		</div>
		
		<div class="text-left">
			<br><br>
			<h1 class="">Mid term line</h1>
			<table class="table">
				<tr>
						<th>Name</th>
						<th>Email</th>
						<th>role</th>
						<th>Action</th>
				</tr>
				<% 
					
					String sql2 = "select email,username,role from employee e inner join workers_allocations wa on e.id = wa.employee_id where product_category ='mid term'";
					rs2 = statement.executeQuery(sql2);

					while(rs2.next()){
						String name = rs2.getString("username");
						String email = rs2.getString("email");
						String role = rs2.getString("role");
				%>
				
				<tr>
					<td><%=name %></td>
					<td><%=email %></td>
					<td><%=role %></td>
					<td>
						<a href="add_prodct.jsp" class="btn btn-primary">Edit</a>
						<a href="add_prodct.jsp" class="btn btn-danger">Delete</a>
					</td>
				</tr>
				<%
					}
					
				%>
			</table>
		</div>
		<br><br>
		<div class="text-left">
			
			<h1 class="">Long term line</h1>
			<div>
			<table class="table">
				<tr>
						<th>Name</th>
						<th>Email</th>
						<th>role</th>
						<th>Action</th>
				</tr>
				<% 
					
					String sql3 = "select email,username,role from employee e inner join workers_allocations wa on e.id = wa.employee_id where product_category ='long term'"; 
					
					rs3 = statement.executeQuery(sql3);

					while(rs3.next()){
						String name = rs3.getString("username");
						String email = rs3.getString("email");
						String role = rs3.getString("role");
				%>
				
				<tr>
					<td><%=name %></td>
					<td><%=email %></td>
					<td><%=role %></td>
					<td>
						<a href="add_prodct.jsp" class="btn btn-primary">Edit</a>
						<a href="add_prodct.jsp" class="btn btn-danger">Delete</a>
					</td>
				</tr>
				<%
					}
					
				%>
			</table>
			</div>
		</div>
		<br>
		<div class="text-left">
			<h1> History of employment</h1>
		<div>
			<table class="table">
				<tr>
						<th>Name</th>
						<th>Email</th>
						<th>role</th>
						<th>Action</th>
				</tr>
				<% 
					
					String sql4 = "select email,username,role from employee e inner join workers_allocations wa on e.id = wa.employee_id";
					rs4 = statement.executeQuery(sql4);

					while(rs4.next()){
						String name = rs4.getString("username");
						String email = rs4.getString("email");
						String role = rs4.getString("role");
				%>
				
				<tr>
					<td><%=name %></td>
					<td><%=email %></td>
					<td><%=role %></td>
					<td>
						<a href="add_prodct.jsp" class="btn btn-primary">Edit</a>
						<a href="add_prodct.jsp" class="btn btn-danger">Delete</a>
					</td>
				</tr>
				<%
					}
					
				%>
			</table>
		</div>
		</div>
	</div>
	<section>
		
	</section>
</body>
</html>