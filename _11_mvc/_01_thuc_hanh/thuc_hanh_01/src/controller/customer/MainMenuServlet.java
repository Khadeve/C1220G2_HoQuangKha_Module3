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

@WebServlet(name = "MainMenuServlet", urlPatterns={"", "/mainMenu"})
public class MainMenuServlet extends HttpServlet {

    private static CustomerService customerService = new CustomerServiceImpl();

    public static CustomerService getCustomerService() {
        return customerService;
    }

    public static void setCustomerService(CustomerService customerService) {
        MainMenuServlet.customerService = customerService;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userAction = request.getParameter("userAction");

        switch(userAction) {
            case "display":
                RequestDispatcher rd_display = request.getRequestDispatcher("displayAll");
                rd_display.forward(request, response);
                break;
            case "add":
                response.sendRedirect("customer_addition.jsp");
                break;
            case "update":
                request.setAttribute("customerList", customerService.displayCustomerList());
                RequestDispatcher view = request.getRequestDispatcher("customer_update.jsp");
                view.forward(request, response);
                break;
            case "delete":
                request.setAttribute("customerList", customerService.displayCustomerList());
                RequestDispatcher view_deletion = request.getRequestDispatcher("customer_deletion_choose.jsp");
                view_deletion.forward(request, response);
                break;
            case "detail":
                request.setAttribute("customerList", customerService.displayCustomerList());
                RequestDispatcher view_detail = request.getRequestDispatcher("customer_detail_choose.jsp");
                view_detail.forward(request, response);
                break;
            default:
                RequestDispatcher rd_default = request.getRequestDispatcher("displayAll");
                rd_default.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
