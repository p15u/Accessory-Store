
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.Order;


@WebServlet(name = "do-checkout", urlPatterns = {"/do-checkout"})
public class CheckoutProcess extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        String fullname = request.getParameter("fullname");
        String address  = request.getParameter("address");
        String zip      = request.getParameter("zip");
        String phone    = request.getParameter("phone");
        String email    = request.getParameter("email");
        String method   = request.getParameter("method");
        String notes    = request.getParameter("notes");
        
        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("account");
        Cart cart = (Cart)session.getAttribute("cart");
        
        Order.checkout(account, cart, fullname, zip, address, phone, email, notes);
        cart.reset();
        
        response.sendRedirect("index.html");
    }
}
