<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, java.io.*, java.util.Properties"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
<% 
//retrieve the data from the session
    System.out.println("line 12 of h.jsp");
    String email=(String)request.getParameter("email");
    String id=(String)request.getParameter("imageId");
    int Id= Integer.parseInt(id);
    System.out.println(email+" "+id);
    
    
    
    Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("loaded");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memories","root","Manu2341");
		System.out.println("connected");
		stmt=con.prepareStatement("Delete  from  memory where `memoryid`=?");
		stmt.setInt(1, Id);
		int i=stmt.executeUpdate();
		
		 session = request.getSession();
         // Set session attributes
         session.setAttribute("useremail", email);
		if (i>0) {
			session.setAttribute("status", "success");
			System.out.println("Deleted Successfully");
	         request.getRequestDispatcher("personal.jsp").forward(request,response);

		}
		else {
			session.setAttribute("status", "fail");
			System.out.println("Deleted not possible");
	         request.getRequestDispatcher("personal.jsp").forward(request,response);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
		rs.close();
			} catch (SQLException ignore) {
			}
		if (stmt != null)
			try {
		stmt.close();
			} catch (SQLException ignore) {
			}
		if (con != null)
			try {
		con.close();
			} catch (SQLException ignore) {
			}
}
		
		
	
    %>

</body>
</html>