<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Signup</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

 <div class="row">
    <div class="col-4">
    <h1></h1>
    </div>
    <div class="col-4" style="padding:50px">
    <h1>SignUp Form</h1>
    <h6>Already Have An Account? <a href="login.jsp">Login</a></h6>
     <form action="signuphandler.jsp" method="post">
  <div class="mb-3">
    <label for="username" class="form-label">Name </label>
    <input type="text" class="form-control" id="name1" name="name" aria-describedby="text" placeholder="Enter The Name" required>
  </div>
   <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" name="email" required id="email1" aria-describedby="emailHelp" placeholder="Enter The Email Address" required>
  </div>
  <div class="mb-3">
    <label for="number" class="form-label">Phone number</label>
    <input type="number" class="form-control" name="pnum" required id="pnum1" placeholder="Enter The Phone Number" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" required name= "password" id="password1" placeholder ="Enter The Password" required>
  </div>
  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
<div class="col-4" >
  
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
 
</body>
