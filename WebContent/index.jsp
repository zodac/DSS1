<html><head>
<title>Login page</title>

<script src="js/bootstrap.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">

<style type="text/css">
    html, body {
      background-color: #B0C4DE;
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