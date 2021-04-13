package controller.customer;

import model.service.CustomerService;
import model.service.impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerListDisplayServlet", urlPatterns = "/displayAll")
public class CustomerListDisplayServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("customerList", customerService.displayCustomerList());
        request.setAttribute("customerList", MainMenuServlet.getCustomerService().displayCustomerList());
        RequestDispatcher view = request.getRequestDispatcher("customer_list_display.jsp");
        view.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
