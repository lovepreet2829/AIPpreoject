package com.mycompany.noticeboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteNoticeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String idStr = request.getParameter("id");

        try {
            int id = Integer.parseInt(idStr);

            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM notice WHERE id=?");
            ps.setInt(1, id);

            int result = ps.executeUpdate();

            if (result > 0) {
                // ✅ Redirect to existing page (correct path)
                response.sendRedirect("viewNotice.jsp");
            } else {
                response.getWriter().println("❌ Failed to delete notice with ID: " + id);
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("❌ Invalid Notice ID format");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Error: " + e.getMessage());
        }
    }
}
