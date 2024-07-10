<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.Properties"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Handler</title>
</head>
<body>

	<%
	String username = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String phone = request.getParameter("pnum");
	System.out.println(username + " " + password + " " + email + " " + phone);

	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	boolean emailExists = false;
	boolean phoneExists = false;

	try {
		// Load the JDBC driver
		System.out.println("hello");
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("loaded");

		// Establish connection
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/memories?useSSL=false", "root", "Manu2341");
		System.out.println("conected");
		// Check if email or phone already exists
		String query = "SELECT * FROM users WHERE email = ? OR pnum = ?";
		pst = con.prepareStatement(query);
		System.out.println("line 36 in sh.jsp");

		pst.setString(1, email);
		pst.setString(2, phone);
		rs = pst.executeQuery();
		System.out.println("line 41 in sh.jsp");

		if (rs.next()) {
			System.out.println("line 41 in sh.jsp......................");

			if (rs.getString("email").equals(email)) {
		emailExists = true;
			}
			if (rs.getString("pnum").equals(phone)) {
		phoneExists = true;
			}
		}
		System.out.println("line 51 in sh.jsp  " + emailExists + " " + phoneExists);

		if (emailExists==true|| phoneExists==true) {

	%>
	<script>
		alert("Email or Pnum Already Exists..");
		window.location.href = "index.jsp";
	</script>
	<%
	System.out.println("line 41 in sh.jsp inside || statement................");

	} else {
	// Insert the new user
	System.out.println("line 61 in sh.jsp");

	String query1 = "INSERT INTO users (`username`, `password`, `email`, `pnum`) VALUES (?, ?, ?, ?)";
	System.out.println("line 69 in sh.jsp");
	pst = con.prepareStatement(query1);
	System.out.println("line 71 in sh.jsp");
	pst.setString(1, username);
	System.out.println("line 73 in sh.jsp");
	pst.setString(2, password);
	pst.setString(3, email);
	System.out.println("line 77 in sh.jsp");
	pst.setString(4, phone);
	System.out.println("line 76 in sh.jsp");
	int result = pst.executeUpdate();
	System.out.println("the result in sh.jsp" + result);
	System.out.println("line 75 in sh.jsp");

	if (result > 0) {
	%>
	<script>
		alert(" Signup successfully");
		window.location.href = "login.jsp";
	</script>
	<%
	} else {
	%>
	<script>
		alert("Could not signup , Try Again...!");
		window.location.href = "index.jsp";
	</script>
	<%
	}
	}
	System.out.println("line 85 in sh.jsp");

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
	%>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>

</body>
</html>
