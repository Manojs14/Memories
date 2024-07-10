package memorys;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/addpo")
@MultipartConfig
public class addpo extends HttpServlet {
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("line 12 in addposthand.jsp");
		String email = (String)request.getParameter("email");	
		String name = (String)request.getParameter("uname");
		String title = (String)request.getParameter("title");
		String message = (String)request.getParameter("message");
		String hastag = (String)request.getParameter("hastag");
		Part img = request.getPart("file");
		System.out.println(email+" "+name + " " + title + " " + message + " " + hastag);



		//fill details in database
		

		try {
			// Load the JDBC driver
			System.out.println("hello");
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("loaded");

			// Establish connection
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/memories?useSSL=false", "root", "Manu2341");
			System.out.println("conected");
			System.out.println("line 47 in addposthand.jsp");

			// Insert the into database
			String query1 = "INSERT INTO memory (`email`, `creator`, `title`, `hastag`,`message`,`image`) VALUES (?,?, ?, ?, ?,?)";
			System.out.println("line 59 in addposthand.jsp");
			pst = con.prepareStatement(query1);
			System.out.println("line 54 in addposthand.jsp");
			pst.setString(1, email);
			System.out.println("line 57 in addposthand.jsp");
			pst.setString(2, name);
			pst.setString(3, title);
			System.out.println("line 59 in addposthand.jsp");
			pst.setString(4, hastag);
			System.out.println("line 62 in addposthand.jsp");
			pst.setString(5, message);
			pst.setBlob(6, img.getInputStream());

			int result = pst.executeUpdate();
			System.out.println("the result in addposthand.jsp   " + result);
			System.out.println("Hellllllllllllllllllllooooooooooooo");
			
			if(result>0) {
			HttpSession s=request.getSession();
			s.setAttribute("useremail", email);
			s.setAttribute("status", "success");
			request.getRequestDispatcher("personal.jsp").forward(request, response);
			}
			else {
			HttpSession s=request.getSession();
			s.setAttribute("useremail", email);
				System.out.println("line 73 of addpo.java");
				s.setAttribute("status", "fail");
				request.getRequestDispatcher("personal.jsp").forward(request, response);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
			rs.close();
				} catch (SQLException ignore) {
				}
			if (pst != null)
				try {
			pst.close();
				} catch (SQLException ignore) {
				}
			if (con != null)
				try {
			con.close();
				} catch (SQLException ignore) {
				}
		}
	}

}
