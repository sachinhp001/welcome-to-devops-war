<html>
<head>
<title>Welcome to devops!</title>
</head>
<body>
	<h1>Welcome to devops!</h1>
	<p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>
</body>
