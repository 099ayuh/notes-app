<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:0;
		padding:0;
		box-sizing: border-box;
	}
    body {
      background-color: #1e1f35;
      font-family: Arial, sans-serif;
      height: 100vh;
      overflow: hidden;
      display: flex;
      justify-content:center;
      align-items:center;

    }

    form {
      border-radius: 10px;
      background-color: #fff;
      border: 1px solid #ccc;
      padding: 20px;
      width: 400px;
      margin: 0 auto;
    }

    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 8px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    input[type="checkbox"] {
      margin-right: 5px;
    }

    button[type="submit"] {
      background-color: #4caf50;
      color: #fff;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    p {
      margin-top: 10px;
    }

    a {
      color: #4caf50;
    }
  </style>
</head>
<%
	session = request.getSession(false);
	if (session.getAttribute("username") != null) {
		response.sendRedirect("home");
	}
	String error = (String) request.getAttribute("error");
%>
<body>
	<form action="login" method="post">
		<div>
			<label for="username">Username: </label>
			<input type="text" id="username" name="uname">
		</div>
		<div>
			<label for="password">Password: </label>
			<input type="password" id="password" name="upass">
		</div>
		<div style="display: flex; justify-center:center; align-items:center;">
			<input type="checkbox" id="showPass" onchange="showPassword()">
			<label for="showPass">Show Password</label>
		</div>
		<p>Don't have an account? <a href="register.jsp">Register</a></p>
		<button type="submit">Login</button>
		<%
			if(error != null) {
				%>
				  <p><%= error %></p>
				<%
			}
		%>
	</form>
</body>
<script type="text/javascript">
	const showPassword = () => {
		let password = document.getElementById('password');
		if(password.type === "password") {
			password.type = "text";
		} else {
			password.type = "password";			
		}
	}
</script>
</html>