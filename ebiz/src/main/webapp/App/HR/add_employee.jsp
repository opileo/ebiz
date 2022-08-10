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
	<section>
	<%
		String id = request.getParameter("id");
		
	%>
		<div class="container text-center " style="width: 40%;">
			<div class="text-center border-dark mt-5">
				<header>
					<h2>Register employee</h2>
					<% 
					String sql = "select * from employee where id="+id+"";
					rs = statement.executeQuery(sql);
					String name = "";
					String email = "";
					String role = "";

					while(rs.next()){
						name = rs.getString("username");
						email = rs.getString("email");
						role = rs.getString("role");
					}
				%>
					<div class="card">
						<form action="../../AddEmployee" method="post">
							<div class="my-3">
							  <label for="name" class="form-label">Employee name</label>
							  <input class="form-control" name="name" type="text" value="<%=name %>" id="name">
							</div>
							<div class="my-3">
							  <label for="email" class="form-label">Email</label>
							  <input class="form-control" name="email" type="email" value="<%=email %>" id="email">
							</div>
							<div class="my-3">
							  <label for="password" class="form-label">Password</label>
							  <input class="form-control" type="text" name="password" id="password" value="1234">
							</div>
							<div class="my-3">
							  <label for="role" class="form-label">Role</label>
							  <select name = "role" id="role">
							  	<option value="manager">Manager</option>
							  	<option value="nmanager">non manager</option>
							  </select>
							</div>
							<br>
							<div class="my-3 text-center">
								<input type="submit" value="Add +" class="btn btn-primary col-md-5">
								<div class="col-md-2"></div>
								<input type="reset" value="Clear" class="btn btn-success col-md-5">
							</div>
						</form>
					</div>
				</header>
			</div>		
		</div>
	</section>
</body>
</html>