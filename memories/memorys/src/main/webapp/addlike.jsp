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
<script type="text/javascript">
		function likestatus() {
			window.location.href = 'personal.jsp?liked=yes';
		}
</script>
<%
System.out.println("line 12 of addlike.jsp");
String email=(String)request.getParameter("email");
String id=(String)request.getParameter("imageId");
int Id= Integer.parseInt(id);
int count=1;
System.out.println(email+" "+Id);

Connection con = null;
PreparedStatement pst = null;
PreparedStatement pst1 = null;
PreparedStatement pst2 = null;
ResultSet rs = null;



try {
	// Load the JDBC driver
	System.out.println("hello");
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("loaded");

	// Establish connection
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/memories?useSSL=false", "root", "Manu2341");
	System.out.println("conected");
	System.out.println("line 47 in addposthand.jsp");
	 
	
	
	String query="SELECT * FROM likes WHERE `emaill`= ? and`Id`= ?";
    pst=con.prepareStatement(query);
    pst.setString(1, email);
    pst.setString(2, id);
    rs=pst.executeQuery();
    
    if(rs.next()){
    	pst1=con.prepareStatement("Delete  from  likes where `memoryid`=?");
		pst1.setInt(1, Id);
		int i=pst1.executeUpdate();
    }
    else{
	
	// Insert the into database
	String query1 = "INSERT INTO likes (`memoryid`,`emaill`, `liked`) VALUES (?,?, ?)";
	System.out.println("line 59 in addlike.jsp");
	pst2 = con.prepareStatement(query1);
	System.out.println("line 54 in addlike.jsp");
	pst2.setInt(1, Id);
	System.out.println("line 57 in addlike.jsp");
	pst2.setString(2, email);
	pst2.setInt(3, count);
	System.out.println("line 59 in addlike.jsp");
	

	int result = pst2.executeUpdate();
	System.out.println("the result in addlike.jsp   " + result);
	System.out.println("Hellllllllllllllllllllooooooooooooo");
	
	if(result>0) {%>
		<script>
		likestatus();
		</script>
		<% 
	}
	
    }
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (rs != null)
		try {
	rs.close();
		} catch (SQLException ignore) {
		}
	if (pst2 != null)
		try {
	pst2.close();
		} catch (SQLException ignore) {
		}
	if (pst1 != null)
		try {
	pst1.close();
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


</body>
</html>