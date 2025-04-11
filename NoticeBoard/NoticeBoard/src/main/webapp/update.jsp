<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mycompany.noticeboard.DBConnection"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM notice WHERE id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    String title = "";
    String message = "";

    if(rs.next()){
        title = rs.getString("title");
        message = rs.getString("message");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Notice</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f7;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        form {
            width: 50%;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        textarea {
            resize: vertical;
            height: 120px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
        }

        .back-link a {
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h2>✏️ Update Notice</h2>

    <form action="UpdateNoticeServlet" method="post">
        <input type="hidden" name="id" value="<%=id%>">

        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="<%=title%>" required>

        <label for="message">Message:</label>
        <textarea id="message" name="message" required><%=message%></textarea>

        <input type="submit" value="Update Notice">
    </form>

    <div class="back-link">
        <a href="viewNotice.jsp">⬅️ Back to Notices</a>
    </div>

</body>
</html>
