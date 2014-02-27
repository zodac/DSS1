<!DOCTYPE html>
<html><head>
	<title>Registration Page</title>
	
	<script src="js/validation.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.tools.min.js"></script>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/customBootstrap.css" rel="stylesheet">
	
	<script>
		$(function() {
			$("#password, #confirm, #username").tooltip({
		    	position: "center right",
		    	offset: [-2, 10],
		    	effect: "fade",
		    	opacity: 0.7
		    });
		});
	</script>
</head>

<body>
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="login-form">
					<h2>Register here</h2>
					<form id="myform" method="POST" name="register" action="RegisterServlet" onsubmit="return validatePasswordsMatch()">
						<fieldset>
							<div class="control-group">
								<input id="username" type="text" name="username" placeholder="Username" title="Must be a unique username" required />
							</div>
							<div class="control-group">
								<input id="password" type="password" name="password" placeholder="Password" title="Must have at least 6 characters" required />
							</div>
							<div class="control-group">
								<input id="confirm" type="password" name="confirm" placeholder="Confirm password" title="Must match above password" required />
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