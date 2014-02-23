<html>
<head>
<title>Import Page</title>

</head>
<body>

	<%
		String userName = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user"))
					userName = cookie.getValue();
			}
		}
		if (userName == null)
			response.sendRedirect("index.jsp");
	%>
	<table class='center'>
		<form name="login" method="post" action="Driver"
			enctype="multipart/form-data">

			<input type="file" value="Import" name="ImportFile"
				accept="application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" />
			<input type="submit" value="Submit" />
		</form>
		<a href="queries.jsp">After you have submitted start querying here</a>
	</table>

</body>
</html>
