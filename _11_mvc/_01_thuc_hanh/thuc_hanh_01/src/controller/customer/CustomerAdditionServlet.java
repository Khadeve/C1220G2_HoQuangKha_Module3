package controller.customer;

import model.bean.Customer;
import model.service.CustomerService;
import model.service.impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerAdditionServlet", urlPatterns="/add")
public class CustomerAdditionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("customerId"));
        String name = request.getParameter("customerName");
        String email = request.getParameter("customerEmail");
        String address = request.getParameter("customerAddress");

        Customer newCustomer = new Customer(id, name, email, address);

        CustomerService customerService = MainMenuServlet.getCustomerService();
        customerService.addNewCustomer(newCustomer);

        MainMenuServlet.setCustomerService(customerService);
        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
