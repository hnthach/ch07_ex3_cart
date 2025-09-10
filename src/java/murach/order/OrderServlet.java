package murach.order;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/order")   // mapping URL trực tiếp ở đây
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ form checkout
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        // Gửi sang trang xác nhận
        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("address", address);

        String url = "/orderConfirmation.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
