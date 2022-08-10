package ProductSaleManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import dbManagement.DBUtil;

/**
 * Servlet implementation class AddProduct
 */
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		Integer price = Integer.parseInt(request.getParameter("price"));
		String category = request.getParameter("category");
		String image = request.getParameter("image");
		
		Connection dbconnection= null;
		Statement statement = null; 
		
//		database connection details
		String url = "jdbc:mysql://localhost:3306/ebiz";
		String username = "root";
		String password = "";
		
//		database provider type
		String dbProvider = "com.mysql.cj.jdbc.Driver";
		try {
			Class.forName(dbProvider);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql = "insert into product (name,price,category,image) values ('"+name+"','"+price+"','"+category+"','"+image+"')";
		try {
			dbconnection = DriverManager.getConnection(url,username,password);
			statement = dbconnection.createStatement();
			statement.executeUpdate(sql);
			
			statement.close();
			dbconnection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		response.sendRedirect("App/ProductSaleManagement/products.jsp");
	}

}
