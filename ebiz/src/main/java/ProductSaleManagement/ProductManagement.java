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
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class ProductManagement
 */
public class ProductManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date daten = new Date();
        String date = formatter.format(daten);
		Integer quantity = Integer.parseInt(request.getParameter("produce"));
		
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
		
		String sql = "insert into days_lt_produce (quantity,date) values ('"+quantity+"','"+date+"')";
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
