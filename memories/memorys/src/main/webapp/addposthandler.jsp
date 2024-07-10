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
	<%
//Fetch details from database
System.out.println("line 12 in addposthand.jsp");
String res = (String)request.getParameter("result");	
int result= Integer.parseInt(res);

	
	
	//To send status to personal.jsp
	if(result>=1){%>
	<script type="text/javascript">
	function gotohome(){
		window.location.href='personal.jsp?status=success';
	}
	</script>
	<% 
	}
	else{%>
	<script type="text/javascript">
	function gotohome(){
		window.location.href='personal.jsp?status=fail';
	}
	</script>
		
	<% }
%>
</body>
</html>