<html>
<head>
<script>
	function validateForm() {
		var x = document.forms["flogin"]["userName"].value;
		var y = document.forms["flogin"]["password"].value;
		if (x == null || x == "" || y == null || y == "") {
			alert("Username and Password must be filled out");
			return false;
		}
	}
</script>
<title>Login page</title>

</head>
<body>
		<form name="flogin" action="LoginServlet" onsubmit="return validateForm()" method="GET">
			User: <input type="text" name="userName" />
			Password: <input type="password" name="password" />
			<input type="submit" value="Login" />
		</form>
		<form action="register.jsp">
			<input type="submit" value="Register" />
		</form>
</body>
</html>