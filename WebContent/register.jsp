<!DOCTYPE html>
<html><head>
	<title>Registration Page</title>
	
	<script src="js/validation.js"></script>
	<script src="js/bootstrap.js"></script>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/customBootstrap.css" rel="stylesheet">
</head>

<body>
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="login-form">
					<h2>Register here</h2>
					<form method="POST" name="register" action="RegisterServlet" onsubmit="return validatePasswordsMatch()">
						<fieldset>
							<div class="control-group">
								<input type="text" name="username" placeholder="Username" required />
							</div>
							<div class="control-group">
								<input type="password" name="password" placeholder="Password" required />
							</div>
							<div class="control-group">
								<input type="password" name="confirm" placeholder="Confirm password" required />
							</div>
							
							<button class="btn btn-primary" type="submit">Register here</button>
							<a href="index.jsp">
								<button class="btn btn-warning" type="button">Cancel</button>
							</a>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body></html>