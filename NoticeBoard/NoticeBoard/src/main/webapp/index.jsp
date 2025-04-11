<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.noticeboard.DBConnection" %>

<h2>Online Notice Board</h2>

<table border="1" cellpadding="10" cellspacing="0">
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Posted On</th>
    </tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    con = DBConnection.getConnection();
    ps = con.prepareStatement("SELECT * FROM notice ORDER BY posted_on DESC");
    rs = ps.executeQuery();

    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("description") %></td>
        <td><%= rs.getString("posted_on") %></td>
    </tr>
<%
    }

} catch(Exception e) {
    out.println("<tr><td colspan='3' style='color:red;'>Error loading notices: " + e.getMessage() + "</td></tr>");
    e.printStackTrace();
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e) {}
    try { if(ps != null) ps.close(); } catch(Exception e) {}
    try { if(con != null) con.close(); } catch(Exception e) {}
}
%>
</table>

<br/>
<a href="admin_login.jsp">Admin Login</a>
