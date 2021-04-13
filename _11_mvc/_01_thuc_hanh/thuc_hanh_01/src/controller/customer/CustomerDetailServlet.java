package controller.customer;

import model.bean.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerDetailServlet", urlPatterns = "/detail")
public class CustomerDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int detailCustomerId = Integer.parseInt(request.getParameter("id"));
        Customer detailCustomer = MainMenuServlet.getCustomerService().findCustomerById(detailCustomerId);
        request.setAttribute("detailCustomer", detailCustomer);
        RequestDispatcher rd = request.getRequestDispatcher("customer_detail.jsp");
        rd.forward(request, response);
    }
}
