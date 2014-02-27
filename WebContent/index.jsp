<!DOCTYPE html>
<html><head>
	<title>Login page</title>
	
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.tools.min.js"></script>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/customBootstrap.css" rel="stylesheet">
	
	<script>
		$(function() {
			$("#password, #username").tooltip({
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
					<h2>Login here</h2>
					<form name="flogin" action="LoginServlet" method="GET">
						<fieldset>
							<div class="control-group">
								<input id="username" type="text" name="userName" placeholder="Username" title="Not case-sensitive" required />
							</div>
							<div class="control-group">
								<input id="password" type="password" name="password" placeholder="Password" title="Case-sensitive" required />
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