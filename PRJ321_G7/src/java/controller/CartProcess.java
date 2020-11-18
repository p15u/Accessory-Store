 
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.Product;

@WebServlet(name = "update-cart", urlPatterns = {"/update-cart"})
public class CartProcess extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        
        String id = request.getParameter("id");
        String act = request.getParameter("act");
        
        Cart cart = (Cart)request.getSession().getAttribute("cart");
        
        if (id == null || act == null || act.isEmpty() || !id.matches("^[0-9]+$")) {
            response.sendRedirect(request.getHeader("referer"));
            return;
        } else if (act.equals("update")) {
            cart.update();
            response.sendRedirect(request.getHeader("referer"));
            return;
        }
        Product pro = DB.getProduct(Integer.valueOf(id));
        if (pro == null) {
            response.sendRedirect(request.getHeader("referer"));
            return;
        }
        
        if (act.equals("add")) {
            cart.add(pro, 1);
        } else if (act.equals("decrease")) {
            cart.decrease(pro);
        } else if (act.equals("remove")) {
            cart.remove(pro);
        }
        
        response.sendRedirect(request.getHeader("referer"));
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doGet(request, response);
    }
}
