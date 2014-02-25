
<html><head>
<title>Registration</title>

<script src="js/validation.js"></script>
<script src="js/bootstrap.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">

<style type="text/css">
    html, body {
      background-color: #eee;
    }
    body {
      padding-top: 40px; 
    }
    .container {
      width: 300px;
    }

    .container > .content {
      background-color: #fff;
      padding: 20px;
      margin: 0 -20px; 
      -webkit-border-radius: 10px 10px 10px 10px;
         -moz-border-radius: 10px 10px 10px 10px;
              border-radius: 10px 10px 10px 10px;
      -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
         -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
              box-shadow: 0 1px 2px rgba(0,0,0,.15);
    }
    
    .login-form {
		margin-left: 65px;
	}
	
	legend {
		margin-right: -50px;
		font-weight: bold;
	 	color: #404040;
	}
</style>

</head>

<body>
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="login-form">
					<h2>Register here</h2>
					<form method="POST" name="register" action="RegisterServlet" onsubmit="return validateRegistrationForm()">
						<fieldset>
							<div class="control-group">
								<input type="text" name="username" placeholder="Username"/>
							</div>
							<div class="control-group">
								<input type="password" name="password" placeholder="Password"/>
							</div>
							<div class="control-group">
								<input type="password" name="confirm" placeholder="Confirm password"/>
							</div>
							
							<button class="btn btn-primary" type="submit">Register</button>
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