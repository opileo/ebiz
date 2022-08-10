<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Auth.*"%>
<%@page import="dbManagement.*"%>
<%@page import="ProductSaleManagement.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User oauth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (oauth != null) {
	    request.setAttribute("person", oauth);
	    OrderDao orderDao  = new OrderDao(DBUtil.getConnection());
		orders = orderDao.userOrders(oauth.getId());
	}else{
		response.sendRedirect("../Auth/login.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	
	%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../includes/head.jsp"%>
<title>Ebiz</title>
</head>
<body>
	<%@include file="../includes/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="../../cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>