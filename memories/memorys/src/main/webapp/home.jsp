<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ page import="java.sql.*, java.io.*, java.util.Properties" %>
    <%@page import="java.net.URLEncoder"%>
	<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
	<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-image: url('image/keith-misner-h0Vxgz5tyXA-unsplash.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	height: 100vh;
}

.top-bar {
	font-family: fantasy;
	background-color: #ffffff;
	color: 000080;
	padding: 14px 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	position: fixed;
	width: calc(100% - 40px);
	top: 10px;
	left: 50%;
	transform: translateX(-50%);
	z-index: 1000;
	display: flex;
	justify-content: center;
	align-items: center;
}

.title {
	font-size: 24px;
	font-weight: bold;
}

.bottom-bar {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #a0a0a0;
	color: white;
	text-align: center;
	padding: 10px 0;
	font-size: 16px;
	z-index: 1000;
}

.content {
	 padding: 100px 10px 10px 10px;
	padding-bottom: 80px;
	box-sizing: border-box;
}
.card {
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin: 20px;
            width:20rem;
            height:30rem;
           
   }
        .image {
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
           
        }
.bottom-left {
  position: absolute;
  bottom: 8px;
  left: 16px;
}

.top-left {
  position: absolute;
  top: 8px;
  left: 16px;
  padding:10px 10px 10px;
  color:Gray;
}
  
</style>
</head>
<body>

<!-- For Top bar -->
<div class="top-bar">
        <div class="title">Memories <img alt="memories" src="image/photo.png" style="width:40px ; height:40px"></div>
 </div>
 <div class="content">
    <div class="container">
            <div class="row">
    
    
    
    
<% 
//retrieve the data from the session
System.out.println("line 12 of h.jsp");
session=request.getSession();
String email=(String)session.getAttribute("useremail");
System.out.println(email);

%>


<!--For redirecting the page -->
<script type="text/javascript">
		var email="<%=email%>";
        function redirectToAddPage() {
            window.location.href = 'setsession.jsp?email='+encodeURIComponent(email);
        }
   </script>
   <script type="text/javascript">
        function logout() {
            window.location.href = 'login.jsp';
        }
   </script>
   
  
   
     <script type="text/javascript">
        function  gotoabout(){
            window.location.href = 'aboutus.jsp?email='  +  encodeURIComponent(email);
        }
   </script> 
   
   <script type="text/javascript">
	var email="<%= email %>";
	function gotopersonal(){
		window.location.href='gopersonal.jsp?email=' +  encodeURIComponent(email);
	}
	</script>
	
		<!-- For displaying photos from database -->
<%
//TO display in personal
Connection con = null;
Statement st = null;
ResultSet rs = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("loaded");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memories" ,"root","Manu2341");
	System.out.println("conected");
	st=con.createStatement();
	rs=st.executeQuery("Select * from memory");
	
	while(rs.next()) {
		System.out.println("line 176 in home.jsp resultset "+rs.getString(1));%>

		<%   Blob blob = rs.getBlob("Image");
            byte[] imageBytes = blob.getBytes(1, (int) blob.length());
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
           System.out.println("After Base 64 in home.jsp");
           String encodedImage = URLEncoder.encode(base64Image, "UTF-8");
			System.out.println("Encoded Image line 163 in home.jsp");%>
	   
                                
                                
 
                  
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100" >
                    <img src="data:image/jpeg;base64,<%= base64Image %>" class="image" alt="Book Image" style="height: 300px;">
                     <div class="top-left" ><b><%= rs.getString(2) %></b></div>
                    <div class="card-body">        
                        <div class="list-group-item" ><small class="text-muted"><%= rs.getString(4)%></small> </div>
                        <div class="list-group-item" style="font-size: 25px;"><b><%= rs.getString(3) %></b></div>
                        <div class="list-group-item"><%= rs.getString(5) %></div>
                    </div>
                </div>
            </div>
                  
<% 
    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    if (rs != null) {
        rs.close();
    }
    if (st != null) {
        st.close();
    }
    if (con != null) {
        con.close();
    }
}
%>
</div>
</div>
</div>

	
	
	
	<!-- For Bottom bar -->
<div class="bottom-bar">
        <div class="title" style="gap:50px; align-items:center;">  <img alt="Home" src="image/round.png" style="width:50px; padding-right:15px;"> <img alt="Add post" src="image/add.png" style="width:50px;" onclick="redirectToAddPage()">      <img alt="personal" src="image/user.png" style="width:50px;padding-left:15px" onclick="gotopersonal()" > <img alt="Home" src="image/information-button.png" style="width:50px;padding-left:15px" onclick="gotoabout()" >  <img alt="Home" src="image/logout.png" style="width:50px;padding-left:15px" onclick="logout()" ></div>
         
 </div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
</html>