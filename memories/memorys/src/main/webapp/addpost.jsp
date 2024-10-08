<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add post</title>
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
	padding: 20px;
	/* Adjust the padding-bottom to ensure content doesn't overlap with the bottom bar */
	padding-bottom: 50px;
	box-sizing: border-box;
}

#form {
	border: 20px solid black; /* Black border */
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5); /* Shadow effect */
	padding: 40px; /* Optional: padding for better layout */
	width: 300px; /* Optional: width of the form */
	margin: 20px auto; /* Optional: center the form */
	border-radius: 10px; /* Optional: rounded corners */
}

.formtop {
	border: 5px solid white;
	background-color: black;
	font-style: fancy;
	color: white;
}
</style>

</head>
<body>




	<%
//retrieve the data from the session
System.out.println("line 92 of ap.jsp");
session=request.getSession();
String email=(String)session.getAttribute("useremail");
boolean islogin= (boolean)session.getAttribute("isLoggedIn");
System.out.println(email+" "+islogin);
%>




	<!-- Redirecting session -->
	<script type="text/javascript">
	var email="<%=email%>";
		function gotohome() {
			window.location.href = 'setsessiontohome.jsp?email='+ encodeURIComponent(email);
		}

		function logout() {
			window.location.href = 'login.jsp';
		}

		function gotopersonal() {
			window.location.href = 'personal.jsp?email=' + encodeURIComponent(email);
		}
		 function  gotoabout(){
	            window.location.href = 'aboutus.jsp?email='  +  encodeURIComponent(email);
	        }
	</script>




	<!-- For Top bar -->
	<div class="top-bar">
		<div class="title">
			Memories <img alt="memories" src="image/photo.png"
				style="width: 40px; height: 40px">
		</div>
	</div>



	<!-- For Form -->
	<div class="content"></div>
	<div class="container text-center">
		<div class="row align-items-start">
			<div class="col"></div>
			<div class="col" id="form">
				<div class="formtop">
					<b>Create a memory</b>
				</div>
				<form action="addpo" method="post" enctype="multipart/form-data">
					<fieldset style="padding: 10px;">
					 <!-- Hidden input to send email -->
                    <input type="hidden" name="email" value="<%= email %>">
                    <%System.out.println("the email in addpost.jsp line 156 "+email); %>
						<div class="mb-3">
							<input type="text" class="form-control" id="name" name="uname"
								aria-describedby="text" placeholder="Creator" required>
						</div>
						<div class="mb-3">
							<input type="text" class="form-control" name="title"
								id="exampleInputtitle1" aria-describedby="titleHelp"
								placeholder="Title" required>
						</div>
						<div class="mb-3">
							<input type="text" class="form-control" name="message"
								id="message" placeholder="Message" required>
						</div>
						<div class="mb-3">
							<input type="text" class="form-control" name="hastag"
								id="exampleInputhastag" placeholder="Hastags" required>
						</div>
						<input type="file" style="padding-bottom: 10px;" name="file"
							accept=".jpg, .jpeg, .png, .gif" required> <br>

						<button type="submit" class="btn btn-primary"
							style="width: 250px;">Submit</button>
					</fieldset>
				</form>
			</div>
			<div class="col"></div>
		</div>
	</div>



	<!-- For Bottom bar -->
	<div class="bottom-bar">
		<div class="title" style="gap: 50px; align-items: center;">
			<img alt="Home" onclick="gotohome()" src="image/round.png"
				style="width: 50px; padding-right: 15px;"> <img alt="Add post"
				src="image/add.png" style="width: 50px;"> <img alt="Home"
				src="image/user.png" style="width: 50px; padding-left: 15px"
				onclick="gotopersonal()"> 
				        <img alt="about us" src="image/information-button.png" style="width:50px; padding-left:15px" onclick="gotoabout()">
				
				<img alt="Home"
				src="image/logout.png" style="width: 50px; padding-left: 15px"
				onclick="logout()">
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