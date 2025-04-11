package com.mycompany.noticeboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddNoticeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String title = request.getParameter("title");
        String message = request.getParameter("message");

        try (PrintWriter out = response.getWriter()) {
            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement("INSERT INTO notice(title, message) VALUES(?, ?)")) {

                ps.setString(1, title);
                ps.setString(2, message);

                int result = ps.executeUpdate();

                if (result > 0) {
                    // Redirect with context path to avoid 404 errors
                    response.sendRedirect(request.getContextPath() + "/viewNotice.jsp");
                } else {
                    out.println("<h3 style='color:red;'>❌ Failed to Add Notice</h3>");
                }

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3 style='color:red;'>⚠️ Error: " + e.getMessage() + "</h3>");
            }
        }
    }
}
