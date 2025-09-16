package murach.cart;

import murach.data.ProductIO;
import murach.business.LineItem;
import murach.business.Cart;
import murach.business.Product;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String url = "/index.jsp";
        ServletContext sc = getServletContext();

        String action = request.getParameter("action");
        if (action == null) {
            action = "cart";
        }

        if (action.equals("shop")) {
            url = "/index.jsp";
        }
        else if (action.equals("cart")) {
            String productCode = request.getParameter("productCode");
            String quantityString = request.getParameter("quantity");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

            int quantity = 1;
            try {
                quantity = Integer.parseInt(quantityString);
                if (quantity < 0) {
                    quantity = 1;
                }
            } catch (NumberFormatException nfe) {
                quantity = 1;
            }

            String path = sc.getRealPath("/WEB-INF/products.txt");
            Product product = ProductIO.getProduct(productCode, path);

            LineItem lineItem = new LineItem();
            lineItem.setProduct(product);
            lineItem.setQuantity(quantity);

            // phân biệt Add, Update và Remove
            String update = request.getParameter("update");

            if (quantity == 0) {
                //  nếu nhập 0 → remove
                cart.removeItem(lineItem);
            } else if (update != null && update.equals("true")) {
                // update số lượng mới
                cart.updateItem(lineItem);
            } else {
                //  add to cart (cộng dồn)
                cart.addItem(lineItem);
            }

            session.setAttribute("cart", cart);
            url = "/cart.jsp";
        }
        else if (action.equals("checkout")) {
            // chuyển sang trang checkout
            url = "/checkout.jsp";

            // ✅ clear giỏ hàng sau khi checkout
            HttpSession session = request.getSession();
            session.removeAttribute("cart");
        }
        sc.getRequestDispatcher(url).forward(request, response);
    }
}
