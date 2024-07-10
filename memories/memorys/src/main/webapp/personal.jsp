<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.Properties"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
	color: #000080;
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
.bottom-right {
  position: absolute;
  bottom: 8px;
  right: 16px;
}
.top-left {
  position: absolute;
  top: 8px;
  left: 16px;
  padding:10px 10px 10px;
  color:Gray;
}
#icon{
font-size:20px;
}
#like-count{
color:black;
font-size:15px;
}

.liked {
            color: #0088ff;
        }
.unliked {
            color: grey;
        }
     
  
</style>
</head>
<body>



	<!--for top bar -->
	<div class="top-bar">
		<div class="title">
			Memories <img alt="memories" src="image/photo.png"
				style="width: 40px; height: 40px">
		</div>
	</div>
	 <div class="content">
        <div class="container">
            <div class="row">

	<% 	//retrieve the data from the session
System.out.println("line 12 of personal.jsp");
String id=null;
session=request.getSession();
String email=(String)session.getAttribute("useremail");
boolean islogin= (boolean)session.getAttribute("isLoggedIn");
System.out.println(email+" "+islogin);
String status=(String)session.getAttribute("status");
String likestatus=request.getParameter("liked");
System.out.println("line 79 fo p.jsp and likedstatus is "+likestatus);
System.out.println("line 80 fo p.jsp and status is "+status);
	if(status!=null && status.equals("success") ) {
	%>
	<div id="notification" class="alert alert-success fade show"
		role="alert"></div>
	<script>
        // Trigger the showNotification function onload
        document.addEventListener('DOMContentLoaded', function() {
            showNotification();
        });

        function showNotification() {
            var notification = document.getElementById('notification');
            notification.innerHTML = 'Uploaded Successfully';
            
            // Add the "show" class to display the alert
            notification.classList.add('show');

            // After 3 seconds, hide the alert using Bootstrap's "hide" class
            setTimeout(function() {
                notification.classList.remove('show');
            }, 3000);
        }
    	</script>
	<% 
	} else if(status!=null && status=="fail" && id!=null) {
		%>
	<div id="notification" class="alert alert-danger fade show"
		role="alert"></div>
	<script>
       // Trigger the showNotification function onload
       document.addEventListener('DOMContentLoaded', function() {
           showNotification();
       });

       function showNotification() {
           var notification = document.getElementById('notification');
           notification.innerHTML = 'Could not upload , Try Again...!';
           
           // Add the "show" class to display the alert
           notification.classList.add('show');

           // After 3 seconds, hide the alert using Bootstrap's "hide" class
           setTimeout(function() {
               notification.classList.remove('show');
           }, 3000);
       }
   	</script>
<% } %>




	<!-- Redirecting session -->
	<script type="text/javascript">
		var email="<%=email%>";
		
        function redirectToAddPage() {
            window.location.href = 'setsession.jsp?email='+encodeURIComponent(email);
        }
   
        function logout() {
            window.location.href = 'login.jsp';
        }
	function gotohome(){
		window.location.href='home.jsp?email=' +  encodeURIComponent(email);
	}
	 function  gotoabout(){
         window.location.href = 'aboutus.jsp?email='  +  encodeURIComponent(email);
     }
	 
</script>





	<%
//TO display in personal
Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("loaded");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/memories" ,"root","Manu2341");
	System.out.println("conected");
	pst=con.prepareStatement("Select * from memory where `email`=?");
	pst.setString(1, email);
	rs=pst.executeQuery();
	
	while(rs.next()) {
		System.out.println("line 176 in personal.jsp resultset "+rs.getString(1));%>

		<%   Blob blob = rs.getBlob("Image");
            byte[] imageBytes = blob.getBytes(1, (int) blob.length());
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
           System.out.println("After Base 64 in personal.jsp");
           String encodedImage = URLEncoder.encode(base64Image, "UTF-8");
			System.out.println("Encoded Image line 219 in personal.jsp");%>
	   
                                
                                
 
                  
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100" >
                    <img src="data:image/jpeg;base64,<%= base64Image %>" class="image" alt="Book Image" style="height: 300px;">
                     <div class="top-left" ><b><%= rs.getString(2) %></b></div>
                    <div class="card-body">        
                        <div class="list-group-item" ><small class="text-muted"><%= rs.getString(4)%></small> </div>
                        <div class="list-group-item" style="font-size: 25px;"><b><%= rs.getString(3) %></b></div>
                        <div class="list-group-item"><%= rs.getString(5) %></div>
                        

                
            	         <form method="post" action="delete.jsp">
                <button type="submit" style="border:solid white; background-color:white;" class="bottom-right"><img src="image/uninstall.png" style="height:25px; width:25px"> Delete</button>            	         
                <input type="hidden" name="imageId" value="<%= rs.getString(7) %>">
                <input type="hidden" name="email" value="<%= rs.getString(1) %>">
                </form>
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
    if (pst != null) {
        pst.close();
    }
    if (con != null) {
        con.close();
    }
}
%>
</div>
</div>
</div>

<!-- For bottom bar -->
<div class="bottom-bar" >

    <div class="title" style="gap: 50px; align-items: center; justify-content: center; padding-left: 50px; ">
        <img alt="Home" src="image/round.png" style="width: 50px; padding-right: 15px;" onclick="gotohome()">
        <img alt="Add post" src="image/add.png" style="width: 50px;" onclick="redirectToAddPage()">
        <img alt="User" src="image/user.png" style="width: 50px; padding-left: 15px">
         <img alt="about us" src="image/information-button.png" style="width:50px; padding-left:15px" onclick="gotoabout()">
        
        <img alt="Logout" src="image/logout.png" style="width: 50px; padding-left: 15px" onclick="logout()">
    </div>
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