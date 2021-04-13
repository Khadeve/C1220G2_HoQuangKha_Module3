package controller.customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerDeletionServlet", urlPatterns = "/delete")
public class CustomerDeletionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int deletedCustomerId = Integer.parseInt(request.getParameter("deletedCustomerId"));
        String userConfirm = request.getParameter("confirmDeletion");

        if (userConfirm.equals("yes")) {
            MainMenuServlet.getCustomerService().deleteCustomerById(deletedCustomerId);
        }
        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("deletedCustomerId", id);
        RequestDispatcher view = request.getRequestDispatcher("customer_deletion_confirm.jsp");
        view.forward(request, response);
    }
}
