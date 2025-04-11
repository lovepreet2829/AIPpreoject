package com.mycompany.noticeboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateNoticeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String message = request.getParameter("message");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE notice SET title=?, message=? WHERE id=?");

            ps.setString(1, title);
            ps.setString(2, message);
            ps.setInt(3, id);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("viewNotice.jsp");
            } else {
                response.getWriter().println("Failed to Update Notice");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
