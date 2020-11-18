package org.apache.jsp.WEB_002dINF.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Cart;
import model.Account;
import java.util.Calendar;

public final class shopping_002dcart_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/WEB-INF/inc/style.jsp");
    _jspx_dependants.add("/WEB-INF/inc/header.jsp");
    _jspx_dependants.add("/WEB-INF/inc/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"description\" content=\"Ogani Template\">\n");
      out.write("    <meta name=\"keywords\" content=\"Ogani, unica, creative, html\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n");
      out.write("    <title>Vietnamese Traditional Cake</title>\n");
      out.write("\n");
      out.write("    ");
      out.write("\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" type=\"text/css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/font-awesome.min.css\" type=\"text/css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/elegant-icons.css\" type=\"text/css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/nice-select.css\" type=\"text/css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/jquery-ui.min.css\" type=\"text/css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/owl.carousel.min.css\" type=\"text/css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/slicknav.min.css\" type=\"text/css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\">\n");
      out.write("    ");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    ");
      out.write('\n');
      out.write('\n');

    if (session == null) session = request.getSession();
    
    Account account = (Account)session.getAttribute("account");
    Cart cart = (Cart)session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }
    
    String uri = request.getRequestURI();
    if (uri == null) uri = "";

      out.write("\n");
      out.write("\n");
      out.write("    <div id=\"preloder\">\n");
      out.write("        <div class=\"loader\"></div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <header class=\"header\">\n");
      out.write("        <div class=\"header__top\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-lg-6 col-md-6\">\n");
      out.write("                        <div class=\"header__top__left\">\n");
      out.write("                            <ul>\n");
      out.write("                                <li><i class=\"fa fa-envelope\"></i>support@tdncake.vn</li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-6 col-md-6\">\n");
      out.write("                        <div class=\"header__top__right\">\n");
      out.write("                            <div class=\"header__top__right__social\">\n");
      out.write("                                <a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\n");
      out.write("                                <a href=\"#\"><i class=\"fa fa-instagram\"></i></a>\n");
      out.write("                                <a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\n");
      out.write("                            </div>\n");
      out.write("                        ");
 if (account != null) { 
      out.write(" \n");
      out.write("                            <div class=\"header__top__right__language\">\n");
      out.write("                                <div>");
      out.print(account.getName());
      out.write("</div>\n");
      out.write("                                <span class=\"arrow_carrot-down\"></span>\n");
      out.write("                                <ul>\n");
      out.write("                                ");
if (account.isEmployee()) { 
      out.write("\n");
      out.write("                                    <li><a href=\"manager.html\">Manager</a></li>\n");
      out.write("                                ");
} else if (account.isAdmin()) {
      out.write("\n");
      out.write("                                    <li><a href=\"dashboard.html\">Dashboard</a></li>\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("                                    <li><a href=\"profile.html\">Profile</a></li>\n");
      out.write("                                    <li><a href=\"orders.html\">Orders</a></li>\n");
      out.write("                                    <li><a href=\"logout\">Logout</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        ");
} else {
      out.write("\n");
      out.write("                            <div class=\"header__top__right__auth\">\n");
      out.write("                                <a href=\"login.html\"><i class=\"fa fa-user\"></i> Login</a>\n");
      out.write("                            </div>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-lg-3\">\n");
      out.write("                    <div class=\"header__logo\">\n");
      out.write("                        <a href=\"./index.html\"><img src=\"img/logo.png\" alt=\"\"></a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-6\">\n");
      out.write("                    <nav class=\"header__menu\">\n");
      out.write("                        <ul>\n");
      out.write("                            <li class=\"");
      out.print((uri.contains("index.html") || uri.endsWith("/")) ? "active" : "" );
      out.write("\"><a href=\"./index.html\">Home</a></li>\n");
      out.write("                            <li class=\"");
      out.print(uri.contains("shop.html") ? "active" : "" );
      out.write("\"><a href=\"./shop.html\">Shop</a></li>\n");
      out.write("                            <li class=\"");
      out.print(uri.contains("contact.html") ? "active" : "" );
      out.write("\"><a href=\"./contact.html\">Contact</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </nav>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-3\">\n");
      out.write("                    <div class=\"header__cart\">\n");
      out.write("                        <ul>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"shopping-cart.html\"><i class=\"fa fa-shopping-bag\">\n");
      out.write("                                </i><span>");
      out.print(cart.count());
      out.write("</span></a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                        ");
if (!cart.isEmpty()) {
      out.write("\n");
      out.write("                        <div class=\"header__cart__price\">\n");
      out.write("                            Total: <span>");
      out.print(cart.total());
      out.write(" VND</span>\n");
      out.write("                        </div>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"humberger__open\">\n");
      out.write("                <i class=\"fa fa-bars\"></i>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </header>");
      out.write("\n");
      out.write("    \n");
      out.write("    <section class=\"breadcrumb-section set-bg\" data-setbg=\"img/breadcrumb.jpg\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-lg-12 text-center\">\n");
      out.write("                    <div class=\"breadcrumb__text\">\n");
      out.write("                        <h2>Shopping Cart</h2>\n");
      out.write("                        <div class=\"breadcrumb__option\">\n");
      out.write("                            <a href=\"index.html\">Home</a>\n");
      out.write("                            <span>Shopping cart</span>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("    \n");
      out.write("    <section class=\"shoping-cart spad\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-lg-12\">\n");
      out.write("                    <div class=\"shoping__cart__table\">\n");
      out.write("                        <table>\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th class=\"shoping__product\">Products</th>\n");
      out.write("                                    <th>Price</th>\n");
      out.write("                                    <th>Quantity</th>\n");
      out.write("                                    <th>Total</th>\n");
      out.write("                                    <th></th>\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            <tbody>\n");
      out.write("                            ");
for (Cart.Item i: cart.getItems()) {
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td class=\"shoping__cart__item\">\n");
      out.write("                                        <img src=\"");
      out.print(i.product.getImage());
      out.write("\" alt=\"\" width=\"100\">\n");
      out.write("                                        <h5>");
      out.print(i.product.getName());
      out.write("</h5>\n");
      out.write("                                    </td>\n");
      out.write("                                    <td class=\"shoping__cart__price\">\n");
      out.write("                                        ");
      out.print(i.product.getPrice());
      out.write(" VND\n");
      out.write("                                    </td>\n");
      out.write("                                    <td class=\"shoping__cart__quantity\">\n");
      out.write("                                        <div class=\"quantity\">\n");
      out.write("                                            <div class=\"pro-qty\">\n");
      out.write("                                                <a href=\"update-cart?act=decrease&id=");
      out.print(i.product.getId());
      out.write("\"><span class=\"dec qtybtn\">-</span></a>\n");
      out.write("                                                <input type=\"text\" value=\"");
      out.print(i.count);
      out.write("\">\n");
      out.write("                                                <a href=\"update-cart?act=add&id=");
      out.print(i.product.getId());
      out.write("\"><span class=\"inc qtybtn\">+</span></a>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </td>\n");
      out.write("                                    <td class=\"shoping__cart__total\">\n");
      out.write("                                        ");
      out.print(i.product.getPrice() * i.count);
      out.write(" VND\n");
      out.write("                                    </td>\n");
      out.write("                                    <td class=\"shoping__cart__item__close\">\n");
      out.write("                                        <a href=\"update-cart?act=remove&id=");
      out.print(i.product.getId());
      out.write("\"><span class=\"icon_close\"></span></a>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                            ");
}
      out.write("\n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-lg-12\">\n");
      out.write("                    <div class=\"shoping__cart__btns\">\n");
      out.write("                        <a href=\"shop.html\" class=\"primary-btn cart-btn\">CONTINUE SHOPPING</a>\n");
      out.write("                        <a href=\"update-cart?act=update\" class=\"primary-btn cart-btn cart-btn-right\">\n");
      out.write("                            UPDATE CART</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-6\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-6\">\n");
      out.write("                ");
if (cart.totalTotal() > 0) {
      out.write("\n");
      out.write("                    <div class=\"shoping__checkout\">\n");
      out.write("                        <h5>Cart Total</h5>\n");
      out.write("                        <ul>\n");
      out.write("                            <li>Shipment <span>");
      out.print(cart.shipCost());
      out.write(" VND</span></li>\n");
      out.write("                            <li>VAT <span>");
      out.print(cart.vat());
      out.write(" VND</span></li>\n");
      out.write("                            <li>Total <span>");
      out.print(cart.totalTotal());
      out.write(" VND</span></li>\n");
      out.write("                        </ul>\n");
      out.write("                    \n");
      out.write("                        <a href=\"checkout.html\" class=\"primary-btn\">PROCEED TO CHECKOUT</a>\n");
      out.write("                    </div>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("    \n");
      out.write("    ");
      out.write("    \n");
      out.write("    \n");
      out.write("    <footer class=\"footer spad\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-lg-3 col-md-6 col-sm-6\">\n");
      out.write("                    <div class=\"footer__about\">\n");
      out.write("                        <div class=\"footer__about__logo\">\n");
      out.write("                            <a href=\"./index.html\"><img src=\"img/logo.png\" alt=\"\"></a>\n");
      out.write("                        </div>\n");
      out.write("                        <ul>\n");
      out.write("                            <li>Phone: +84 386000555</li>\n");
      out.write("                            <li>Email: support@tdncake.vn</li>\n");
      out.write("                            <li>Address: 600, Nguyen Van Cu street, Ninh Kieu district, Can Tho city.</li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-4 col-md-6 col-sm-6 offset-lg-1\">\n");
      out.write("                    <div class=\"footer__widget\">\n");
      out.write("                        <h6>Site map</h6>\n");
      out.write("                        <ul>\n");
      out.write("                            <li><a href=\"index.html\">Home</a></li>\n");
      out.write("                            <li><a href=\"shop.html\">Shop</a></li>\n");
      out.write("                            <li><a href=\"conntact.html\">Contact</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                        <ul>\n");
      out.write("                            <li><a href=\"shopping-cart.html\">Shopping cart</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-4 col-md-12\">\n");
      out.write("                    <div class=\"footer__widget\">\n");
      out.write("                        <h6>Join Our Newsletter Now</h6>\n");
      out.write("                        <p>Get E-mail updates about our latest shop and special offers.</p>\n");
      out.write("                        <form action=\"#\">\n");
      out.write("                            <input type=\"text\" placeholder=\"Enter your mail\">\n");
      out.write("                            <button type=\"submit\" class=\"site-btn\">Subscribe</button>\n");
      out.write("                        </form>\n");
      out.write("                        <div class=\"footer__widget__social\">\n");
      out.write("                            <a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\n");
      out.write("                            <a href=\"#\"><i class=\"fa fa-instagram\"></i></a>\n");
      out.write("                            <a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-lg-12\">\n");
      out.write("                    <div class=\"footer__copyright\">\n");
      out.write("                        <div class=\"footer__copyright__text\">\n");
      out.write("                            <p>Copyright &copy; ");
      out.print(Calendar.getInstance().get(Calendar.YEAR));
      out.write(" - All rights reserved</p>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"footer__copyright__payment\"><img src=\"img/payment-item.png\" alt=\"\"></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </footer>");
      out.write("\n");
      out.write(" \n");
      out.write("    <script src=\"js/jquery-3.3.1.min.js\"></script>\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    <script src=\"js/jquery.nice-select.min.js\"></script>\n");
      out.write("    <script src=\"js/jquery-ui.min.js\"></script>\n");
      out.write("    <script src=\"js/jquery.slicknav.js\"></script>\n");
      out.write("    <script src=\"js/mixitup.min.js\"></script>\n");
      out.write("    <script src=\"js/owl.carousel.min.js\"></script>\n");
      out.write("    <script src=\"js/main.js\"></script>\n");
      out.write("</body> \n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
