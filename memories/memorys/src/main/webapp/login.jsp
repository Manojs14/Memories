<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>

	<div class="container text-center" style="padding:50px; padding-top:100px;">
		<h3>Login</h3>
		<b>Don't have an account?<a href="index.jsp">Signup</a></b>
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4">
	<%System.out.println("line 39 of l.jsp"); %>

				<form action="loginhandler.jsp" method="post">
					<div class="mb-3">
						<label for="exampleInputName" class="form-label">Email</label> <input
							type="text" name="email" class="form-control"
							id="exampleInputName" aria-describedby="NameHelp" required>
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password</label>
						<input type="password" name="password" class="form-control"
							id="exampleInputPassword1" required>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
			<div class="col-4"></div>
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