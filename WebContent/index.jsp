<!DOCTYPE html>
<html><head>
	<title>Login page</title>
	
	<script src="js/bootstrap.js"></script>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/customBootstrap.css" rel="stylesheet">
</head>

<body>
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="login-form">
					<h2>Login here</h2>
					<form name="flogin" action="LoginServlet" method="GET">
						<fieldset>
							<div class="control-group">
								<input type="text" name="userName" placeholder="Username" required />
							</div>
							<div class="control-group">
								<input type="password" name="password" placeholder="Password" required />
							</div>
							<button class="btn btn-primary" type="submit">Sign In</button>
							<a href="register.jsp">
								<button class="btn btn-primary" type="button">Register</button>
							</a>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body></html>