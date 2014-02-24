
<html><head>
<title>Registration</title>
</head>

<script src="validation.js"></script>

<body>

		<form method="get" name="register" action="RegisterServlet" onsubmit="return validateRegistrationForm()">
			<p>Enter your username and password</p>
			Username: <input type="text" name="username" />
			Password: <input type="password" name="password" />
			Confirm password: <input type="password" name="confirm" />
			<input type="submit" value="Register" />
			<input type="button" value="Cancel" onclick="window.location.href='index.jsp'" />
		</form>
</body>

</html>