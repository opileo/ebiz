package HR;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import ProductSaleManagement.Order;
import ProductSaleManagement.Product;
import ProductSaleManagement.ProductDao;


public class Generate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con;
		String url = "jdbc:mysql://localhost:3306/ebiz";
		String username = "root";
		String password = "";
		String query;
		PreparedStatement pst;
	    ResultSet rs;

		query = "select * from employee where role=?";
		ArrayList<Employee> employees = new ArrayList<>();
		int number = 0;
		 try {
			 con = DriverManager.getConnection(url,username,password);
			pst = con.prepareStatement(query);
			int id = 1;
			pst.setInt(1, id);
	         rs = pst.executeQuery();
	         while (rs.next()) {
	             Employee emp = new Employee();
	             emp.setId(rs.getInt("id"));
	             
	             employees.add(emp);
	             number++;
			
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 if(employees!= null) {
			 for(int i=0;i<number;number++) {}
		 }
         
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
