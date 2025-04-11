<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - NoticeBoard</title>
</head>
<body bgcolor="#f0f8ff" style="font-family:Arial, sans-serif;">

    <table width="100%" height="100%" align="center">
        <tr>
            <td align="center" valign="middle">
                <table cellpadding="20" cellspacing="0" border="1" bordercolor="#4B9CD3" bgcolor="#ffffff" style="border-radius: 15px;">
                    <tr>
                        <td align="center" colspan="2">
                            <h2 style="color: #4B9CD3;">🔐 Welcome to NoticeBoard Login</h2>
                            <p style="font-size: 14px; color: #555;">Please enter your credentials to access your account.</p>
                        </td>
                    </tr>

                    <% String error = request.getParameter("error"); if (error != null) { %>
                    <tr>
                        <td colspan="2" align="center">
                            <font color="red"><b><%= error %></b></font>
                        </td>
                    </tr>
                    <% } %>

                    <form action="LoginServlet" method="post">
                        <tr>
                            <td align="right"><label for="username">👤 Username:</label></td>
                            <td><input type="text" id="username" name="username" placeholder="e.g. admin123" title="Enter your username" required></td>
                        </tr>
                        <tr>
                            <td align="right"><label for="password">🔒 Password:</label></td>
                            <td><input type="password" id="password" name="password" placeholder="••••••••" title="Enter your password" required></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" value="Login" style="padding: 8px 16px; background-color: #4B9CD3; color: white; border: none; border-radius: 5px; cursor: pointer;">
                            </td>
                        </tr>
                    </form>

                    <tr>
                        <td colspan="2" align="center">
                            <p style="font-size: 12px; color: #888;">New here? <a href="register.jsp" title="Click to register">Create an account</a></p>
                            <p style="font-size: 12px; color: #888;"><a href="forgotPassword.jsp" title="Recover your password">Forgot Password?</a></p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</body>
</html>
