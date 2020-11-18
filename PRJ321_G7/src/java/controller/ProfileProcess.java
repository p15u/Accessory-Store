
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

@WebServlet(name = "update-info", urlPatterns = {"/update-info"})
public class ProfileProcess extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("account");
        
        if (request.getParameter("change-avatar") != null) {
            String avatar = request.getParameter("avatar");
            account.changeAvatar(avatar);
        } else if (request.getParameter("update") != null) {
            String fullname = request.getParameter("fullname");
            String idcard = request.getParameter("idcard");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String birthday = request.getParameter("birthday");
            String gender = request.getParameter("gender");
            account.update(fullname, idcard, phone, email, address, birthday, gender); 
        } else if (request.getParameter("change-pass") != null) {
            String current = request.getParameter("current");
            String password = request.getParameter("password");
            account.changePassword(current, password);
        }
        
        response.sendRedirect(request.getHeader("referer"));
    }
}
