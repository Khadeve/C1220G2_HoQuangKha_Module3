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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserManagementServlet", urlPatterns = {"", "/manage"})
public class UserManagementServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String clientAction = request.getParameter("userAction");

        switch (clientAction) {
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

            case "addPermission":
                int userId = Integer.parseInt(request.getParameter("id"));

                /* New */
                String permission1 = request.getParameter("permission1");
                String permission2 = request.getParameter("permission2");
                String permission3 = request.getParameter("permission3");
                String permission4 = request.getParameter("permission4");

                int[] permissionArr = getPermissionArray(permission1, permission2, permission3, permission4);

                String message = null;
                if (permissionArr != null) {
                    User user = userService.findUserById(userId);
                    boolean isSuccess = userService.addPermissionForUser(user, permissionArr);
                    if (isSuccess) {
                        message = "Successfully";
                    } else {
                        message = "fail";
                    }
                } else {
                    message = "Please choose at least one option!";
                }

                request.setAttribute("message", message);
                request.setAttribute("id", userId);
                RequestDispatcher view = request.getRequestDispatcher("permission_choose.jsp");
                view.forward(request, response);

                /*-----------------------------------*/
//                List<Integer> permissions = new ArrayList<>();
//                int addPermission = 0;
//                int editPermission = 0;
//                int deletePermission = 0;
//                int viewPermission = 0;
//
//                String permission1 = request.getParameter("permission1");
//                if (permission1 != null) {
//                    addPermission = Integer.parseInt(permission1);
//                    permissions.add(addPermission);
//                }
//
//                String permission2 = request.getParameter("permission2");
//                if (permission2 != null) {
//                    editPermission = Integer.parseInt(permission2);
//                    permissions.add(editPermission);
//                }
//
//                String permission3 = request.getParameter("permission3");
//                if (permission3 != null) {
//                    deletePermission = Integer.parseInt(permission3);
//                    permissions.add(deletePermission);
//                }
//
//                String permission4 = request.getParameter("permission4");
//                if (permission4 != null) {
//                    viewPermission = Integer.parseInt(permission4);
//                    permissions.add(viewPermission);
//                }
//
//                int[] permissionArr = null;
//                String message = null;
//
//                if (permissions.size() > 0) {
//                    permissionArr = new int[permissions.size()];
//                    for (int i = 0; i < permissions.size(); i++) {
//                        permissionArr[i] = permissions.get(i);
//                    }
//
//                    User user = userService.findUserById(userId);
//                    boolean isSuccess = userService.addPermissionForUser(user, permissionArr);
//
//                    if(isSuccess) message = "Successfully";
//                    else message = "Fail";
//                } else if (permissions.size() == 0) {
//                    message = "Please choose at least one option!";
//                }
//
//                request.setAttribute("message", message);
//                request.setAttribute("id", userId);
//                RequestDispatcher view = request.getRequestDispatcher("permission_choose.jsp");
//                view.forward(request, response);
                break;

            case "addUserTransaction":
                String newUserStr = request.getParameter("newUser");
                String[] userInfo = newUserStr.split(",");
                String userName = userInfo[0];
                String userEmail = userInfo[1];
                String userNation = userInfo[2];
                User aNewUser = new User(userName, userEmail, userNation);

                String addPermission = request.getParameter("permission1");
                String editPermission = request.getParameter("permission2");
                String deletePermission = request.getParameter("permission3");
                String viewPermission = request.getParameter("permission4");

                int[] permissionArray = getPermissionArray(addPermission, editPermission, deletePermission, viewPermission);

                String msg = "";
                if (permissionArray != null) {
                    boolean isSuccess = userService.addUserTransaction(aNewUser, permissionArray);
                    if (isSuccess) {
                        msg = "Successfully";
                    } else {
                        msg = "fail";
                    }
                } else {
                    msg = "Please choose at least one option!";
                }

                request.setAttribute("message", msg);
                request.setAttribute("newUser", aNewUser);
                RequestDispatcher view_transaction = request.getRequestDispatcher("permission_choose_transaction.jsp");
                view_transaction.forward(request, response);
                break;

            default:
                displayUserList(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userAction = request.getParameter("userAction");

        if (userAction == null) {
            userAction = "";
        }

        int userId = 0;
        User user = null;
        switch (userAction) {
            case "add":
                response.sendRedirect("user_addition.jsp");
                break;

            case "update":
                userId = Integer.parseInt(request.getParameter("id"));
                user = userService.findUserById(userId);
                request.setAttribute("user", user);
                RequestDispatcher view = request.getRequestDispatcher("user_update.jsp");
                view.forward(request, response);
                break;

            case "delete":
                userId = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("id", userId);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_deletion_confirm.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "addPermission":
                userId = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("id", userId);
                RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("permission_choose.jsp");
                requestDispatcher1.forward(request, response);
                break;

            case "addBaseInfoTransaction":
                response.sendRedirect("user_addition_transaction.jsp");
                break;

            case "addUserTransaction":
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String country = request.getParameter("country");

                User newUser = new User(name, email, country);
                request.setAttribute("newUser", newUser);
                RequestDispatcher requestDispatcher2 = request.getRequestDispatcher("permission_choose_transaction.jsp");
                requestDispatcher2.forward(request, response);
                break;
            default:
                displayUserList(request, response);
        }
    }

    private void displayUserList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> userList = userService.getUserList();
        request.setAttribute("userList", userList);
        RequestDispatcher rd = request.getRequestDispatcher("user_list_display.jsp");
        rd.forward(request, response);
    }

    private int[] getPermissionArray(String addPermission, String editPermission,
                                     String deletePermission, String viewPermission) {
        List<Integer> permissions = new ArrayList<>();
        int addPermissionTemp = 0;
        int editPermissionTemp = 0;
        int deletePermissionTemp = 0;
        int viewPermissionTemp = 0;

        if (addPermission != null) {
            addPermissionTemp = Integer.parseInt(addPermission);
            permissions.add(addPermissionTemp);
        }

        if (editPermission != null) {
            editPermissionTemp = Integer.parseInt(editPermission);
            permissions.add(editPermissionTemp);
        }

        if (deletePermission != null) {
            deletePermissionTemp = Integer.parseInt(deletePermission);
            permissions.add(deletePermissionTemp);
        }

        if (viewPermission != null) {
            viewPermissionTemp = Integer.parseInt(viewPermission);
            permissions.add(viewPermissionTemp);
        }

        int[] permissionArr = null;

        if (permissions.size() > 0) {
            permissionArr = new int[permissions.size()];
            for (int i = 0; i < permissions.size(); i++) {
                permissionArr[i] = permissions.get(i);
            }
            return permissionArr;
        }

        return null;
    }
}
