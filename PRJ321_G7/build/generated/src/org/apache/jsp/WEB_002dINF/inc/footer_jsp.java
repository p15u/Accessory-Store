package org.apache.jsp.WEB_002dINF.inc;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

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
