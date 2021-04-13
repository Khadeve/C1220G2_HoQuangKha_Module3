package controller.customer;

import model.bean.Customer;
import model.service.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerUpgradeServlet", urlPatterns = "/update")
public class CustomerUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int oldId = Integer.parseInt(request.getParameter("oldId"));
        int id = Integer.parseInt(request.getParameter("customerId"));
        String name = request.getParameter("customerName");
        String email = request.getParameter("customerEmail");
        String address = request.getParameter("customerAddress");

        Customer newlyUpdatedCustomer = new Customer(id, name, email, address);
        CustomerService customerService = MainMenuServlet.getCustomerService();
        customerService.deleteCustomerById(oldId);  // delete the old customer.

        customerService.addNewCustomer(newlyUpdatedCustomer); // add the newly updated customer.
        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer updatedCustomer = MainMenuServlet.getCustomerService().findCustomerById(id);

        request.setAttribute("updatedCustomer", updatedCustomer);
        RequestDispatcher rd = request.getRequestDispatcher("customer_update_new_info.jsp");
        rd.forward(request, response);
    }
}
