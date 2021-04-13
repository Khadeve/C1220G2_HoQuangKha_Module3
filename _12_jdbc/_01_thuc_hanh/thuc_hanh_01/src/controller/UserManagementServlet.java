package controller;

import model.bean.User;
import model.repository.UserRepo;
import model.repository.impl.UserRepoImpl;
import model.service.UserService;
import model.service.impl.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserManagementServlet", urlPatterns = {"", "/manage"})
public class UserManagementServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String clientAction = request.getParameter("userAction");

        switch(clientAction) {
            case "add":
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String country = request.getParameter("country");

                User newUser = new User(name, email, country);
                userService.addNewUser(newUser);
                displayUserList(request, response);
                break;

            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                String updatedName = request.getParameter("name");
                String updatedEmail = request.getParameter("email");
                String updatedCountry = request.getParameter("country");

                User updatedUser = new User(id, updatedName, updatedEmail, updatedCountry);
                userService.updateUserById(id, updatedUser);
                displayUserList(request, response);
                break;

            case "delete":
                int id_deletion = Integer.parseInt(request.getParameter("id"));
                String userConfirm = request.getParameter("confirmDeletion");

                if (userConfirm.equals("yes")) {
                    userService.deleteUserById(id_deletion);
                }
                displayUserList(request, response);
                break;

            case "search":
                String userCountry = request.getParameter("country");
                List<User> users = userService.findUserByCountry(userCountry);
                request.setAttribute("userList", users);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_list_display.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "sort":
                List<User> userList = userService.sortByName();
                request.setAttribute("userList", userList);
                RequestDispatcher rd = request.getRequestDispatcher("user_list_display.jsp");
                rd.forward(request, response);
                break;

            default:
                displayUserList(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String userAction = request.getParameter("userAction");

        if (userAction == null) {
            userAction = "";
        }

        switch(userAction) {
            case "add":
                response.sendRedirect("user_addition.jsp");
                break;

            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                User user = userService.findUserById(id);
                request.setAttribute("user", user);
                RequestDispatcher view = request.getRequestDispatcher("user_update.jsp");
                view.forward(request, response);
                break;

            case "delete":
                int userId = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("id", userId);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_deletion_confirm.jsp");
                requestDispatcher.forward(request, response);
                break;
            default:
                displayUserList(request, response);
        }
    }

    private void displayUserList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        List<User> userList = userService.getUserList();
        request.setAttribute("userList", userList);
        RequestDispatcher rd = request.getRequestDispatcher("user_list_display.jsp");
        rd.forward(request, response);
    }
}
