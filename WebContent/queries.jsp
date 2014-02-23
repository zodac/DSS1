
<html>

<head>
<title>Queries Page</title>
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
		<form method="get" name="login" action="IMSIServlet">
			<h3>Queries</h3>
			<ul>
				<li>
					<p>Enter an IMSI and get back the Event ID and the Cause Code</p>
					IMSI: <input type="text" name="IMSI" /> <input type="submit"
					value="Query" />
				</li>
			</ul>
		</form>
	</table>

</body>
</html>