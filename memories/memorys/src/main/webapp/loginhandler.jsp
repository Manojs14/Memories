<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.Properties" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup</title>
</head>
<body>

<%
	System.out.println("line 12 in lh.jsp");
	String email = request.getParameter("email");
    String password = request.getParameter("password");
	System.out.println(password+" "+email);

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    boolean emailExists = false;

    try {
    	System.out.println("line 24 in lh.jsp");

        // Load the JDBC driver
        System.out.println("hello");
        Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("loaded");

        // Establish connection
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memories?allowPublicKeyRetrieval=true&useSSL=false" ,"root","Manu2341");
		System.out.println("conected");
        // Check if email already exists
        String query = "SELECT * FROM users WHERE email = ?";
        pst = con.prepareStatement(query);
		System.out.println("line 36 in lh.jsp");
        pst.setString(1, email);
        rs = pst.executeQuery();
		System.out.println("line 41 in lh.jsp");

        while (rs.next() ) {
            if (rs.getString("email").equals(email)) {
            	emailExists = true;
            	System.out.println("emailExists===="+emailExists);
            }
           
        }
		System.out.println("line 51 in lh.jsp");
            if (emailExists==false) {%>
            	<script>
        		alert("Email not Exists , please Signup");
        		window.location.href = "index.jsp";
        		</script>
        		<% 
            }
         else {
        	
            //Checking if the password is correct or not
            		System.out.println("line 63 in lh.jsp");

            query="SELECT * FROM USERS WHERE `email`= ? and`password`= ?";
            pst=con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
             rs=pst.executeQuery();
             
             
             session = request.getSession();
             session.setAttribute("useremail", email);
             
            if (rs.next()) {
        		System.out.println("line 74 in lh.jsp");
                request.getRequestDispatcher("setsessiontohome.jsp").forward(request,response);
        		System.out.println("line 76 in lh.jsp");
            } else {%>
            	<script>
        		alert("incorrect password, Try Again..!");
        		window.location.href = "login.jsp";
        		</script><%             }
        }
		System.out.println("line 85 in lh.jsp");

    } catch (Exception e) {
	e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pst != null) try { pst.close(); } catch (SQLException ignore) {}
        if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }
	System.out.println("line 93 in lh.jsp");

%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
 
</body>
</html>
+