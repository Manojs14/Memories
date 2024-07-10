//package memorys;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/Signup")
//public class signup {
//	
//		  Connection con;
//		  PreparedStatement pstmt;
//		  ResultSet rs;
//		    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
//		            throws ServletException, IOException {
//		    	System.out.println();
//		    	System.out.println("arrived ");
//		    	System.out.println();
//		        String name=req.getParameter("uname");
//		        String pass =req.getParameter("pass");
//		        String email=req.getParameter("email");
//		        String pnum=req.getParameter("pnum");
//		        //Employee emp=new Employee();
//		        
//		        try {
//					Class.forName("com.mysql.cj.jdbc.Driver");
//					System.out.println("loaded");
//					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memories" ,"root","Manu2341");
//					System.out.println("conected");
//					//check if email already exists
//					pstmt=con.prepareStatement("select count(*) from employees where `email`=?");
//					pstmt.setString(1, email);
//					rs=pstmt.executeQuery();
//					System.out.println(rs);
//					if(rs.next()) {
//						int count=rs.getInt(1);
//						if(count>0) {
//						req.setAttribute("emialexist","emailAlreadyExists");
//						req.getRequestDispatcher("signup.jsp").forward(req,res);
//						return;
//						}
//					}
//					//check if pnum already exists
//					pstmt=con.prepareStatement("select count(*) from employees where `pnum`=?");
//					pstmt.setString(1, pnum);
//					rs=pstmt.executeQuery();
//					if(rs.next()) {
//						int count=rs.getInt(1);
//						if(count>0) {
//						System.out.println("present");
//						req.setAttribute("pnumexist","pnumAlreadyExists");
//						req.getRequestDispatcher("signup.jsp").forward(req,res);
//						return;
//					} 
//					}
//					//Enter details to data base
//					pstmt=con.prepareStatement("insert into (`uname`,`pass`,`email`,`pnum`)Values(?,?,?,?)");
//					pstmt.setString(1, name);
//					pstmt.setString(2, pass);
//					pstmt.setString(3, email);
//					pstmt.setString(4, pnum);
//					int count=pstmt.executeUpdate();
//					System.out.println(count);
//					if(count>0) {
//					req.getRequestDispatcher("login.jsp").forward(req,res);
//					}
//					else {
//					req.getRequestDispatcher("signup.jsp").forward(req, res);
//					}
//				} catch (SQLException |ClassNotFoundException e) {
//					e.printStackTrace();
//				}
//		    finally {
//		    	try {
//					pstmt.close();
//					con.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//		    }
//		 }    } 
