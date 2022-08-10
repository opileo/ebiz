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
	<body class="">
		<div class="container">
			<div>
				<h1 class="text-primary text-center">Products</h1>
				<form action="../../ProductManagement">
					<div class="row m-5">
						<div class="col-md-2"></div>
						<div class="col-md-3 text-md-right">
							<label for="produce" class="form-label h4">Set Day's long term produce</label>
						</div>
						<div class="col-md-7 row">
							<div class="col-md-6">
								<input class="form-control" name="produce" id="produce" type="number" placeholder="Enter expected day's produce" required>
							</div>
							<div class="col-md-6">
								<input class="btn btn-primary" type="submit" value="Set">
							</div>
						</div>
					</div>
				</form>
			</div>
			<br>
			<div class="row border border-radius-5 bg-success">
			<div class="col-md-2"></div>
				<%
					String sql1 = "select * from days_lt_produce order by date desc";
					rs = statement.executeQuery(sql1);
	
					while(rs.next()){
						String quantity = rs.getString("quantity");
						String date = rs.getString("date");
						int quantity_mt = Integer.parseInt(quantity)*2;
						int quantity_st = Integer.parseInt(quantity)*10;
				%>
				<div class="col-md-10">
					<h3>Products per day current:<%=quantity %></h3>
					<p class="budge-info">Last set:<span class="text-success"><%=date %></span></p>
					<h4>Long term:<span class="text-success"><%=quantity %></span></h4>
					<h4>Mid term:<span class="text-success"><%=quantity_mt %></span></h4>
					<h4>Short term:<span class="text-success"><%=quantity_st %></span></h4>
				</div>
				<%
						break;
					}
				%>
			</div>
			<br>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-10">
					<table style="width:100%;" class="">
						<tr>
								<th>Image</th>
								<th>Name</th>
								<th>price</th>
								<th>Action</th>
						</tr>
						<% 
							String sql = "select * from product";
							rs = statement.executeQuery(sql);
		
							while(rs.next()){
								String name = rs.getString("name");
								String price = rs.getString("price");
								//String image = rs.getString("image");
						%>
						
						<tr>
							<td><%="image" %></td>
							<td><%=name %></td>
							<td><%=price %></td>
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
	</body>
</html>