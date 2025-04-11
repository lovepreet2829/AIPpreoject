<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    HttpSession session1 = request.getSession(false);
    if(session1 == null || session1.getAttribute("username") == null){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 30px;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        .container {
            background-color: white;
            border-radius: 10px;
            display: inline-block;
            padding: 30px 50px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
        }

        .btn {
            display: block;
            margin: 20px auto;
            padding: 12px 25px;
            width: 200px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .logout {
            background-color: #dc3545;
        }

        .logout:hover {
            background-color: #a71d2a;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Welcome, <%= session1.getAttribute("username") %> 👋</h2>
        <a href="AddNotice.jsp" class="btn">➕ Add Notice</a>
        <a href="viewNotice.jsp" class="btn">📋 View Notices</a>
        <a href="LogoutServlet" class="btn logout">🚪 Logout</a>
    </div>

</body>
</html>
