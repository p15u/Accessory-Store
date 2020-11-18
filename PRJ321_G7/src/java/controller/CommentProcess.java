
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

@WebServlet(name = "comment", urlPatterns = {"/comment"})
public class CommentProcess extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String content = request.getParameter("content");
        String id = request.getParameter("id");
        Account account = (Account)request.getSession().getAttribute("account");
        
        if (account != null && content != null && !content.isEmpty()
            && id != null && id.matches("^[0-9]+$")) {
            if (request.getParameter("cmt") != null) {
                account.comment(Integer.valueOf(id), content);
            } else if (request.getParameter("rep") != null) {
                account.reply(Integer.valueOf(id), content);
            }
        }
        
        response.sendRedirect(request.getHeader("referer"));
    }
}
