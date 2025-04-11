<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.mycompany.noticeboard.DBConnection"%>

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
    <title>All Notices</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f7;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        .top-links {
            text-align: center;
            margin-bottom: 20px;
        }

        .top-links a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
            margin: 0 15px;
            font-size: 16px;
        }

        .top-links a:hover {
            text-decoration: underline;
        }

        table {
            border-collapse: collapse;
            width: 90%;
            margin: auto;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .action-links a {
            color: #2c3e50;
            text-decoration: none;
            font-weight: bold;
            margin-right: 10px;
        }

        .action-links a:hover {
            color: #e74c3c;
        }
    </style>
</head>
<body>

<h2>📢 All Notices</h2>

<div class="top-links">
    <a href="adminhome.jsp">🏠 Dashboard</a> 
    <a href="logout.jsp">🚪 Logout</a>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Message</th>
        <th>Action</th>
    </tr>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        con = DBConnection.getConnection();
        st = con.createStatement();
        rs = st.executeQuery("SELECT * FROM notice");

        while(rs.next()){
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("message") %></td>
        <td class="action-links">
            <a href="update.jsp?id=<%=rs.getInt("id")%>">✏️ Update</a>
            <a href="DeleteNoticeServlet?id=<%=rs.getInt("id")%>" onclick="return confirm('Are you sure to delete this notice?')">🗑️ Delete</a>
        </td>
    </tr>
<%
        }
    } catch(Exception e){
%>
    <tr><td colspan="4" style="text-align:center;color:red;"><%= "Error: " + e.getMessage() %></td></tr>
<%
    } finally {
        if(rs != null) try { rs.close(); } catch (Exception ex) {}
        if(st != null) try { st.close(); } catch (Exception ex) {}
        if(con != null) try { con.close(); } catch (Exception ex) {}
    }
%>

</table>

</body>
</html>
