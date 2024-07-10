<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
            display: flex;
            flex-direction: column;
            justify-content: space-between;
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

        .center-container {
            display: flex;
            flex: 1;
            justify-content: center;
            align-items: center;
        }

        .content {
            text-align: center;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            
        }
        
        p{
        font-size:25px;
        }
        
    </style>
</head>
<body>
  
  
<%
System.out.println("line 83 of abu.jsp ");
String email=(String)request.getParameter("email");
System.out.println("line 83 of abu.jsp "+email);

%>
<!-- For top bar -->
<div class="top-bar">
    <div class="title">Memories <img alt="memories" src="image/photo.png" style="width:40px; height:40px"></div>
</div>

<div class="center-container">
    <div class="content">
      <b> <h1>About Us</h1> </b> 
        <b><p>Email: <a href="mailto:manucharlie121@gmail.com">manucharlie121@gmail.com</a></p></b>
        <b><p>Contact Number: <a href="tel:+919740693455">+919740693455</a></p></b>
        <b><p>Team Name: The Innovators</p></b>
    </div>
</div>




<script type="text/javascript">
		var email="<%=email%>";
		
        function redirectToAddPage() {
            window.location.href = 'setsession.jsp?email='+encodeURIComponent(email);
        }
   
        function logout() {
            window.location.href = 'login.jsp';
        }
	function gotohome(){
		window.location.href='setsessiontohome.jsp?email=' +  encodeURIComponent(email);
	}
	
	function gotopersonal() {
		window.location.href = 'gopersonal.jsp?email=' + encodeURIComponent(email);
	}
</script>

<!-- For Bottom bar -->
<div class="bottom-bar">
    <div class="title" style="gap:50px; align-items:center;">
        <img alt="Home" src="image/round.png" style="width:50px; padding-right:15px;" onclick="gotohome()">
        <img alt="Add post" src="image/add.png" style="width:50px;" onclick="redirectToAddPage()">
        <img alt="personal" src="image/user.png" style="width:50px; padding-left:15px" onclick="gotopersonal()">
        <img alt="about us" src="image/information-button.png" style="width:50px; padding-left:15px" onclick="gotoabout()">
        <img alt="logout" src="image/logout.png" style="width:50px; padding-left:15px" onclick="logout()">
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2mGkbo9iMfB5t0niyBQWf8Z5R4Ww4Nf2y0ZzH4rtkDd2IOVyk5KfqIxOf+M" crossorigin="anonymous"></script>
</body>
</html>
