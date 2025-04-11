<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    HttpSession session1 = request.getSession(false);
    if(session1 == null || session1.getAttribute("username") == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Notice</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f1f1;
            padding: 30px;
        }

        .container {
            background-color: white;
            max-width: 600px;
            margin: auto;
            padding: 25px 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 12px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            margin: 0 10px;
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Post a New Notice</h2>

    <form action="AddNoticeServlet" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" placeholder="Enter notice title" required>

        <label for="message">Message:</label>
        <textarea id="message" name="message" rows="5" placeholder="Enter detailed message..." required></textarea>

        <input type="submit" value="Add Notice">
    </form>

    <div class="links">
        <a href="adminhome.jsp">🏠 Home</a>
        <a href="logout.jsp">🚪 Logout</a>
    </div>
</div>

</body>
</html>
