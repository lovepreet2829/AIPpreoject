<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%
if(session.getAttribute("username") == null){
    response.sendRedirect("login.jsp");
}
%>

<html>
<head>
<title>Dashboard</title>
</head>
<body>
<h1>Welcome to Dashboard</h1>
</body>
</html>
