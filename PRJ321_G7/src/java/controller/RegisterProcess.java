
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Role;

@WebServlet(name = "register", urlPatterns = {"/register"})
public class RegisterProcess extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        boolean success = DB.register(username, password, Role.CUSTOMER);
        
        if (success) {
            response.setContentType("text/html;charset=UTF-8");
            request.setAttribute("msg", "Register successfully!");
            response.setHeader("Refresh", "3;url=login.html");
            request.getRequestDispatcher("/WEB-INF/inc/redirect.jsp")
                .include(request, response);
        } else {
            response.sendRedirect("register.html#register-fail");
        }
    }
}
