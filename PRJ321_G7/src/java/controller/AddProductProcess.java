
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Product;

@WebServlet(name = "add", urlPatterns = {"/add"})
public class AddProductProcess extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("account");
        if (account == null || !account.isEmployee()) {
            response.sendError(404);
            return;
        }
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String information = request.getParameter("information");
        
        int price = Integer.valueOf(request.getParameter("price"));
        int size = Integer.valueOf(request.getParameter("size"));
        int weight = Integer.valueOf(request.getParameter("weight"));
        int category = Integer.valueOf(request.getParameter("category"));
        
        String image = request.getParameter("image");
        String subImgs[] = request.getParameterValues("sub-image");
        
        if (Product.existName(name)) {
            //
            return;
        }
        
        account.addProduct(category, name, size, weight, description,
            price, image, information, subImgs);
        response.sendRedirect("manager.html");
    }
}
