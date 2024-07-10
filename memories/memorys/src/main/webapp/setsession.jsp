<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	System.out.println("at page ss.jsp line11");
    // Assuming 'email' is a request parameter
    String email = request.getParameter("email");

    // Set session attributes
    session.setAttribute("useremail", email);
    session.setAttribute("isLoggedIn", true);

    // Redirect to home.jsp
    response.sendRedirect("addpost.jsp");
	System.out.println("at page ss.jsp "+ email);

%>
</body>
</html>