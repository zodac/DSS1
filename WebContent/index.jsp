<html><head>
<script src="validation.js"></script>

<title>Login page</title>

</head><body>
	<form name="flogin" action="LoginServlet" onsubmit="return validateLoginForm()" method="GET">
		User: <input type="text" name="userName" />
		Password: <input type="password" name="password" />
		<input type="submit" value="Login" />
	</form>
	
	<form action="register.jsp">
		<input type="submit" value="Register" />
	</form>
	
</body></html>