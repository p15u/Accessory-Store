
package controller;

import com.restfb.types.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.Cart;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class LoginProcess extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        // Block GET without params
        if (request.getQueryString() == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        // Facebook login
        String code = request.getParameter("code");
        
        if (code != null && !code.isEmpty()) {
            String token = RestFb.getToken(code);
            User user = RestFb.getUserInfo(token);
            System.out.println(user.getName());
            response.sendRedirect("index.html");
        } else {
            response.sendRedirect("login.html#login-social-fail");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        
        Account account = (Account)session.getAttribute("account");
        String act = request.getParameter("act");
        
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Cart());
        }
        
        if (account != null) {
            response.sendRedirect("index.html");
            return;
        }
        
        if (act != null && act.equals("fb")) {
            String url = request.getRequestURL().toString();
            // Block cross-page login
            if (!url.endsWith("/login")) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            } else {
                RestFb.FB_REDIRECT_URL = url;
                response.sendRedirect(RestFb.getOAuthUrl());  
            }
        } else if (act != null && act.equals("gg")) {
            //response.sendRedirect("login.html#login-social-fail");
            response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
        } else {
            // Normal login
            String username = request.getParameter("txtUser");
            String password = request.getParameter("txtPass");
            account = DB.login(username, password);
            if (account != null) {
                session.setAttribute("account", account);
                request.setAttribute("msg", "Login successfully!");
                response.setContentType("text/html;charset=UTF-8");
                response.setHeader("Refresh", "3;url=index.html");
                request.getRequestDispatcher("/WEB-INF/inc/redirect.jsp")
                    .include(request, response);
            } else {
                response.sendRedirect("login.html#login-fail");
            }
        }
    }
}
